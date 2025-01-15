!/usr/bin/env bash

# Debian
sudo apt-get install nala
sudo nala install \
	bat btop curl fzf gcc kitty neovim ripgrep tldr zsh python3 rsync make \
	inotify-tools git gh unzip fd fastfetch eza \
	snapper distrobox build-essential gdb kcachegrind massif-visualizer \
	qalculate-gtk hyperfine feh ffmpeg vlc\
	sway sway-notification-center waybar pavucontrol wofi rfkill blueman \
	gammastep brightnessctl slurp grim wl-clipboard cliphist wlogout swaylock \
	playerctl \
	texlive-full

# Fedora
sudo nvim /etd/dnf/dnf.conf
#   defaultyes=true
#   max_parallel_downloads=16
#   fastestmirror=true

# NixOs
sudo ln -s $(pwd)/nixos/configuration.nix /etc/nixos/configuration.nix
sudo ln -s $(pwd)/nixos/hardware-configuration.nix  /etc/nixos/hardware-configuration.nix


sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
	fish bat btop curl fzf gcc kitty neovim ripgrep tldr zsh zip \
	python3 rsync inotify-tools git gh unzip fd fastfetch eza snapper \
	distrobox kcachegrind massif-visualizer qalculate-gtk hyperfine \
	make cmake libasan libubsan dnf-plugins-core dnf-plugins-extra \
	maven java-17-openjdk-devel \
	gtk3 webkit2gtk3 libusb \
	qbittorrent calibre \
	texlive-scheme-full pdflatex pandoc \
sudo dnf copr enable pgdev/ghostty && sudo dnf install ghostty

mkdir $HOME/gitclone
cd    $HOME/gitclone

# Fish
ln -s $(pwd)/fish $HOME/.config/fish
chsh -s $(which fish)

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv $HOME/.oh-my-zsh $HOME/gitclone/oh-my-zsh
ln -s $(pwd)/oh-my-zsh $HOME/.oh-my-zsh
rm $HOME/.zshrc
ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git             $HOME/gitclone/pure
git clone https://github.com/zsh-users/zsh-autosuggestions     $HOME/gitclone/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/gitclone/zsh-syntax-highlighting

ln -s $(pwd)/pure                               $HOME/.oh-my-zsh/custom/themes/pure
mv $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh.old
ln -s $(pwd)/zsh/pure.zsh                       $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh
ln -s $(pwd)/zsh-autosuggestions                $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -s $(pwd)/zsh-syntax-highlighting            $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# Basics
ln -s $(pwd)/help     $HOME/help
ln -s $(pwd)/scripts   $HOME/scripts
ln -s $(pwd)/set-up.sh $HOME/.set-up.sh
ln -s $(pwd)/btop      $HOME/.config/btop
ln -s $(pwd)/nvim      $HOME/.config/nvim
ln -s $(pwd)/ghostty   $HOME/.config/ghostty

# Bat Catppuccin
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
bat cache --build
# BAT_THEME="Catppuccin Macchiato"

# Gnome
dconf load / <$(pwd)/dconf-settings.ini # load settings
# dconf dump / >$(pwd)/dconf-settings.ini # save settings
# sudo cp /home/gabri/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml
sudo cp /home/gabri/.config/monitors.xml /var/lib/gdm/.config/monitors.xml

# Sway / Hyprland
ln -s $(pwd)/waybar  $HOME/.config/waybar
ln -s $(pwd)/wlogout $HOME/.config/wlogout
ln -s $(pwd)/wofi    $HOME/.config/wofi
ln -s $(pwd)/sway    $HOME/.config/sway
ln -s $(pwd)/hypr    $HOME/.config/hypr

# Arch
ln -s $(pwd)/paru    $HOME/.config/paru

# Old
ln -s $(pwd)/i3      $HOME/.config/i3
ln -s $(pwd)/kitty   $HOME/.config/kitty
ln -s $(pwd)/tmux    $HOME/.config/tmux
ln -s $(pwd)/zathura $HOME/.config/zathura

# Snapper create config (only for `/home` directory, change to `/` if needed)
sudo umount /home/.snapshots
sudo rmdir /home/.snapshots
sudo snapper -c home create-config /home
sudo btrfs subvolume delete /home/.snapshots
sudo mount -av

# Snapper config
sudo mv    /etc/snapper/configs                         /etc/snapper/configs.bk
sudo mv    /lib/systemd/system/snapper-timeline.timer   /lib/systemd/system/snapper-timeline.timer.bk
sudo mv    /lib/systemd/system/snapper-boot.timer       /lib/systemd/system/snapper-boot.timer.bk
sudo mv    /lib/systemd/system/snapper-cleanup.timer    /lib/systemd/system/snapper-cleanup.timer.bk
sudo ln -s $(pwd)/snapper/configs                       /etc/snapper/configs
sudo ln -s $(pwd)/snapper/system/snapper-timeline.timer /lib/systemd/system/snapper-timeline.timer
sudo ln -s $(pwd)/snapper/system/snapper-boot.timer     /lib/systemd/system/snapper-boot.timer
sudo ln -s $(pwd)/snapper/system/snapper-cleanup.timer  /lib/systemd/system/snapper-cleanup.timer
