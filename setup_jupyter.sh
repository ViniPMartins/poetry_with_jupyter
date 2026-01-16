# ===== CONFIGURAÇÕES =====
KERNEL_NAME="ambiente_virtual"
DISPLAY_NAME="Python (ambiente_virtual)"
PY_VERSION="3.12.9"

# ===== INICIALIZAR PROJETO =====
if [ ! -f pyproject.toml ]; then
    poetry init
fi

# ===== DEFINIR PYTHON =====
pyenv local "$PY_VERSION"
poetry env use "$PY_VERSION"

# ===== INSTALAR DEPENDÊNCIAS NO VENV =====
poetry add jupyter ipykernel

# ===== REGISTRAR KERNEL =====
poetry run python -m ipykernel install --user \
    --name "$KERNEL_NAME" \
    --display-name "$DISPLAY_NAME"

# ===== INICIAR JUPYTER =====
poetry run jupyter lab
