#!/bin/bash

# Install oh-my-zsh https://ohmyz.sh/#install

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fonts
git clone https://github.com/powerline/fonts.git --depth=1

fonts/./install.sh

# Copy .zshrc file
echo Copying .zshrc backup file
cp .zshrc ~/

# Install themes
echo Installing themes
cd  ~/.oh-my-zsh/themes/
git clone https://github.com/agnoster/agnoster-zsh-theme.git
mv agnoster-zsh-theme/agnoster.zsh-theme ~/.oh-my-zsh/themes/
