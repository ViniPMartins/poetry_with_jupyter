# Nome do ambiente virtual (pasta)
VENV_NAME=venv

# Nome do kernel no Jupyter (sem espaços)
KERNEL_NAME=ambiente_virtual

# Nome que aparece no Jupyter
DISPLAY_NAME=Python (ambiente_virtual)

PY_VERSION=3.13.2

.PHONY: install_kernel start_jupyter

init_poetry_project:
	poetry init

set_python_local: init_poetry_project
	pyenv local $(PY_VERSION)
	poetry env use $(PY_VERSION)

install_kernel: set_python_local
	. $(VENV_NAME)/bin/activate && \
	pip install ipykernel && \
	python -m ipykernel install --user --name $(KERNEL_NAME) --display-name "$(DISPLAY_NAME)"

start_jupyter: install_kernel
	. $(VENV_NAME)/bin/activate && \
	jupyter lab