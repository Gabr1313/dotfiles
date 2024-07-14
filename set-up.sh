#!/usr/bin/env bash
sudo nala install bat btop curl fzf gcc kitty neovim ripgrep tldr zsh python3 rsync fd-find make \
                  inotify-tools git unzip fd-find fastfetch eza \
                  snapper distrobox build-essential gdb kcachegrind massif-visualizer \
	              hyperfine feh ffmpeg \
                  sway sway-notification-center waybar pavucontrol wofi rfkill blueman \
                  gammastep brightnessctl slurp grim wl-clipboard cliphist wlogout swaylock

# sudo nala install bat btop curl fzf gcc kitty neovim ripgrep tldr zsh python3 rsync fd-find make \
#                 inotify-tools git unzip firefox fd-find fastfetch eza
# others: snapper distrobox lua cmake meson ninja-build gdb kcachegrind massif-visualizer hyperfine 
#         feh ffmpeg
# sway:   sway sway-notification-center waybar pulseaudio pavucontrol wofi rfkill blueman gammastep
#         brightnessctl slurp grim wl-clipboard cliphist wlogout swaylock

# sudo paru -S bat btop curl fzf gcc kitty neovim ripgrep tldr zsh python3 rsync fd-find make 
# inotify-tools git unzip firefox fd fastfetch eza snapper distrobox lua base-devel kcachegrind 
# massif-visualizer hyperfine feh ffmpeg sway swaync waybar pavucontrol wofi rfkill blueman 
# gammastep brightnessctl slurp grim wl-clipboard cliphist wlogout swaylock
# pipewire pipewire-audio pipewire-alsa  pipewire-pulse wireplumber alsa-firmware alsa-utils
# pulseaudio 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc
ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git $HOME/.oh-my-zsh/custom/themes/pure
mv $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh.old
ln -s $(pwd)/zsh/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# chsh -s $(which zsh)

# Basics
# ln -s $(pwd)/btop           $HOME/.config/btop
# ln -s $(pwd)/kitty          $HOME/.config/kitty
# ln -s $(pwd)/nvim           $HOME/.config/nvim
# ln -s $(pwd)/utils/scripts/ $HOME/.local/scripts
# ln -s $(pwd)/help/    $HOME/help

# Sway / Hyprland
# ln -s $(pwd)/waybar  $HOME/.config/waybar
# ln -s $(pwd)/wlogout $HOME/.config/wlogout
# ln -s $(pwd)/wofi    $HOME/.config/wofi
# ln -s $(pwd)/sway    $HOME/.config/sway
# ln -s $(pwd)/hypr    $HOME/.config/hypr

# Arch
# ln -s $(pwd)/paru    $HOME/.config/paru

# NixOs
# sudo ln -s $(pwd)/nixos/configuration.nix /etc/nixos/configuration.nix
# sudo ln -s $(pwd)/nixos/hardware-configuration.nix  /etc/nixos/hardware-configuration.nix

# Old
# ln -s $(pwd)/i3      $HOME/.config/i3
# ln -s $(pwd)/tmux    $HOME/.config/tmux
# ln -s $(pwd)/zathura $HOME/.config/zathura

# Gnome
# dconf load / <$(pwd)/dconf-settings.ini # dconf dump / >projects/.dotfiles/dconf-settings.ini
# sudo cp /home/gabri/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml

# Snapper (only for home directory, change the first part for root)
# sudo umount /home/.snapshots
# sudo rmdir /home/.snapshots
# sudo snapper -c home create-config /home
# sudo btrfs subvolume delete /home/.snapshots
# sudo mount -av
# sudo mv    /etc/snapper/configs                         /etc/snapper/configs.bk
# sudo mv    /lib/systemd/system/snapper-timeline.timer   /lib/systemd/system/snapper-timeline.timer.bk
# sudo mv    /lib/systemd/system/snapper-boot.timer       /lib/systemd/system/snapper-boot.timer.bk
# sudo mv    /lib/systemd/system/snapper-cleanup.timer    /lib/systemd/system/snapper-cleanup.timer.bk
# sudo ln -s $(pwd)/snapper/configs                       /etc/snapper/configs
# sudo ln -s $(pwd)/snapper/system/snapper-timeline.timer /lib/systemd/system/snapper-timeline.timer
# sudo ln -s $(pwd)/snapper/system/snapper-boot.timer     /lib/systemd/system/snapper-boot.timer
# sudo ln -s $(pwd)/snapper/system/snapper-cleanup.timer  /lib/systemd/system/snapper-cleanup.timer
