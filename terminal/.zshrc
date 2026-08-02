# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to “random”
# it’ll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
 git
 bundler
 macos
 rbenv
 ruby
)

source $ZSH/oh-my-zsh.sh

# User configuration

# LANGUAGE SUPPORT
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# RBENV SUPPORT
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Configuração local desta máquina (não versionada). Criada por `make terminal`.
[[ -f "$HOME/.dotfiles-profile.zsh" ]] && source "$HOME/.dotfiles-profile.zsh"
