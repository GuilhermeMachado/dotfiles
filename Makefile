SHELL := /usr/bin/env bash

.PHONY: help terminal ruby

help:
	@echo "Alvos disponíveis:"
	@echo "  make terminal   Configura zsh/oh-my-zsh e symlinka .zshrc"
	@echo "  make ruby       Instala a versão do Ruby/.ruby-version via rbenv e roda bundle install"

terminal:
	./scripts/terminal.sh

ruby:
	./scripts/ruby.sh
