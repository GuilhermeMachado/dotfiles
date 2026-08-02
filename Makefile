SHELL := /usr/bin/env bash

.PHONY: help terminal ruby python

help:
	@echo "Alvos disponíveis:"
	@echo "  make terminal   Configura zsh/oh-my-zsh e symlinka .zshrc"
	@echo "  make ruby       Instala a versão do Ruby/.ruby-version via rbenv e roda bundle install"
	@echo "  make python     Instala a versão do Python/.python-version via pyenv e atualiza o pip"

terminal:
	./scripts/terminal.sh

ruby:
	./scripts/ruby.sh

python:
	./scripts/python.sh
