#!/bin/bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1

# install fonts
fonts./install.sh
rm -rf fonts

# copy .zshrc file
echo Copying .zshrc backup file
cp .zshrc ~/

#install themes
echo Installing themes
cd /Users/gmachado/.oh-my-zsh/themes/
git clone https://github.com/agnoster/agnoster-zsh-theme.git
mv agnoster-zsh-theme/agnoster.zsh-theme /Users/gmachado/.oh-my-zsh/themes/
rm -rf agnoster-zsh-theme
