SHELL := /usr/bin/env bash

.PHONY: help terminal

help:
	@echo "Alvos disponíveis:"
	@echo "  make terminal   Configura zsh/oh-my-zsh e symlinka .zshrc"

terminal:
	./scripts/terminal.sh
