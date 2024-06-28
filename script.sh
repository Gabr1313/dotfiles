#!/usr/bin/env bash
sudo nala install bat btop curl eza fzf gcc gdb kitty fastfetch neovim ripgrep \
tldr zsh python3 rsync fd-find cmake
# others: git firefox unzip distrobox lua

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc
ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git $HOME/.oh-my-zsh/custom/themes/pure
mv $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh.old
ln -s $(pwd)/zsh/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -s $(pwd)/btop $HOME/.config/btop
ln -s $(pwd)/kitty $HOME/.config/kitty
ln -s $(pwd)/nvim $HOME/.config/nvim
ln -s $(pwd)/utils/scripts/ $HOME/.local/scripts
ln -s $(pwd)/utils/help/ $HOME/help

ln -s $(pwd)/hypr $HOME/.config/hypr
ln -s $(pwd)/waybar $HOME/.config/waybar

# ln -s $(pwd)/paru $HOME/.config/paru
# ln -s $(pwd)/i3 $HOME/.config/i3
# ln -s $(pwd)/sway $HOME/.config/sway
# ln -s $(pwd)/tmux $HOME/.config/tmux
# ln -s $(pwd)/wofi $HOME/.config/wofi
# ln -s $(pwd)/zathura $HOME/.config/zathura

# gnome related settings
    # dconf dump / >projects/.dotfiles/dconf-settings.ini
# dconf load / <$(pwd)/dconf-settings.ini
# cp ~/.config/monitors.xml ~gdm3/.config/
