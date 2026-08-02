#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PYTHON_DIR="$DOTFILES_DIR/Python"
VERSION="$(cat "$PYTHON_DIR/.python-version")"

if ! command -v pyenv >/dev/null 2>&1; then
  echo "pyenv não encontrado. Rode 'brew bundle' primeiro (instala o pyenv)." >&2
  exit 1
fi

echo "Instalando Python $VERSION via pyenv (pula se já instalado)..."
pyenv install --skip-existing "$VERSION"
pyenv global "$VERSION"
eval "$(pyenv init -)"
pyenv rehash

CURRENT_GLOBAL="$(pyenv global)"
if [[ "$CURRENT_GLOBAL" != "$VERSION" ]]; then
  echo "Falha ao definir $VERSION como versão global do pyenv (ficou em '$CURRENT_GLOBAL')." >&2
  exit 1
fi
echo "Confirmado: pyenv global = $CURRENT_GLOBAL"

echo "Atualizando o pip..."
python -m pip install --upgrade pip
pyenv rehash

echo ""
echo "Python $VERSION configurado como versão global do pyenv."
echo "Abra um novo terminal ou rode: exec zsh"
