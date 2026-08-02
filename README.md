Are you tired of configuring your Mac every time you switch to a new machine? Fear not, this repository has got you covered! Welcome to my repository, designed to simplify the setup of your development environment with a few simple steps.

## 1. Using the Brewfile
The Brewfile in this repository contains a list of applications and utilities that I use in my development environment. To use the Brewfile, you will need to have Homebrew installed on your machine.

```
$ brew bundle
```

This will install all of the applications and utilities listed in the Brewfile.

## 2. Terminal Configuration
```
$ make terminal
```
This installs Oh My Zsh if needed, sets up the Agnoster theme, and symlinks `.zshrc`. The first time it runs on a machine, it also asks for this machine's git author name/email and saves them to `~/.dotfiles-profile.zsh` — a machine-local file that is never tracked by git. `terminal/.zshrc` sources it automatically.

To install the Powerline-patched fonts needed for the theme's glyphs:
```
$ swift iterm2/install_powerline_fonts.swift
```

## 3. Ruby Configuration
```
$ make ruby
```
This installs the Ruby version pinned in `Ruby/.ruby-version` via rbenv (skips if already installed), sets it as the rbenv global version, then installs bundler and the gems from `Ruby/Gemfile`.
