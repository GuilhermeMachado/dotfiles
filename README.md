# Brewfile + Iterm2 + Ruby Configuration

Welcome to my repository, designed to simplify the setup of my development environment. Here, you will find a Brewfile, swift scripts for Iterm2, and ruby configuration.

## 1. Using the Brewfile
The Brewfile in this repository contains a list of applications and utilities that I use in my development environment. To use the Brewfile, you will need to have Homebrew installed on your machine.

```
$ brew bundle
```

This will install all of the applications and utilities listed in the Brewfile.

## 2. Iterm2 Configuration
To configure Iterm2, you will need to run the following three swift scripts:
```
$ swift install_oh_my_zsh.swift
$ swift install_agnoster.swift
$ swift install_powerline_fonts.swift
```
These scripts will install and configure Oh My Zsh, the Agnoster theme, and the Powerline fonts, respectively. This will give you a beautiful and functional terminal environment with all the necessary tools and customization.

## 3. Ruby Configuration
To configure Ruby, you will need to run the following two swift scripts:

```
$ swift install_ruby_version.swift <version>
$ swift install_bundler_and_gems.swift
```
These scripts will install the desired Ruby version and the bundler gem, along with any other gems specified in the script.
