#!/usr/bin/bash
sudo nala install zsh curl git kitty neovim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s $HOME/projects/.dotfiles/zsh/.zshrc $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git $HOME/.oh-my-zsh/custom/themes/
cp $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh.old
ln -s $HOME/projects/.dotfiles/zsh/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh

ln -s $HOME/projects/.dotfiles/btop $HOME/.config/btop

ln -s $HOME/projects/.dotfiles/kitty $HOME/.config/kitty

ln -s $HOME/projects/.dotfiles/nvim $HOME/.config/nvim

ln -s $HOME/projects/.dotfiles/utils/scripts/ $HOME/.local/scripts
