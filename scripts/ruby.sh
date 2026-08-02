#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RUBY_DIR="$DOTFILES_DIR/Ruby"
VERSION="$(cat "$RUBY_DIR/.ruby-version")"

if ! command -v rbenv >/dev/null 2>&1; then
  echo "rbenv não encontrado. Rode 'brew bundle' primeiro (instala o rbenv)." >&2
  exit 1
fi

echo "Instalando Ruby $VERSION via rbenv (pula se já instalado)..."
rbenv install --skip-existing "$VERSION"
rbenv global "$VERSION"
eval "$(rbenv init -)"
rbenv rehash

CURRENT_GLOBAL="$(rbenv global)"
if [[ "$CURRENT_GLOBAL" != "$VERSION" ]]; then
  echo "Falha ao definir $VERSION como versão global do rbenv (ficou em '$CURRENT_GLOBAL')." >&2
  exit 1
fi
echo "Confirmado: rbenv global = $CURRENT_GLOBAL"

echo "Instalando bundler e as gems de Ruby/Gemfile..."
gem install bundler
rbenv rehash
BUNDLE_GEMFILE="$RUBY_DIR/Gemfile" bundle install
rbenv rehash

echo ""
echo "Ruby $VERSION configurado como versão global do rbenv."
echo "Abra um novo terminal ou rode: exec zsh"
