#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_FILE="$HOME/.dotfiles-profile.zsh"

if [[ ! -f "$PROFILE_FILE" ]]; then
  echo "Primeira vez nesta máquina — vamos criar $PROFILE_FILE (local, nunca versionado)."
  read -rp "Nome para git (GIT_AUTHOR_NAME): " git_name
  read -rp "E-mail para git (GIT_AUTHOR_EMAIL): " git_email
  cat > "$PROFILE_FILE" <<EOF
export GIT_AUTHOR_NAME="$git_name"
export GIT_AUTHOR_EMAIL="$git_email"
export GIT_COMMITTER_NAME="\$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="\$GIT_AUTHOR_EMAIL"
EOF
  echo "Criado $PROFILE_FILE."
fi

link() {
  local src="$1" dest="$2"
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "Já linkado: $dest"
    return
  fi
  if [[ -e "$dest" || -L "$dest" ]]; then
    local backup="$dest.bak.$(date +%s)"
    mv "$dest" "$backup"
    echo "Backup criado: $backup"
  fi
  ln -s "$src" "$dest"
  echo "Link criado: $dest -> $src"
}

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "oh-my-zsh já instalado, pulando instalação."
else
  echo "Instalando oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

link "$DOTFILES_DIR/terminal/.zshrc" "$HOME/.zshrc"

echo ""
echo "Terminal configurado. Abra um novo terminal ou rode: exec zsh"
