#!/usr/bin/env bash
sudo nala install bat btop curl fzf gcc kitty neovim ripgrep tldr zsh python3 rsync fd-find make \
                  inotify-tools git gh unzip fd-find fastfetch eza \
                  snapper distrobox build-essential gdb kcachegrind massif-visualizer \
                  qalculate-gtk hyperfine feh ffmpeg vlc\
                  sway sway-notification-center waybar pavucontrol wofi rfkill blueman \
                  gammastep brightnessctl slurp grim wl-clipboard cliphist wlogout swaylock \
                  playerctl
                  # texlive # texlive-science texlive-full

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir $HOME/gitclone
mv $HOME/.oh-my-zsh $HOME/gitclone/oh-my-zsh
ln -s $(pwd)/gitclone/oh-my-zsh $HOME/.oh-my-zsh
rm $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git             $HOME/github/pure
git clone https://github.com/zsh-users/zsh-autosuggestions     $HOME/gitclone/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/gitclone/zsh-syntax-highlighting

mv $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh.old
ln -s $HOME/github/pure                         $HOME/.oh-my-zsh/custom/themes/pure
ln -s $(pwd)/zsh/pure.zsh                       $HOME/.oh-my-zsh/custom/themes/pure/pure.zsh
ln -s $HOME/gitclone/zsh-autosuggestions        $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -s $HOME/gitclone/zsh-syntax-highlighting    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

# Basics
ln -s $(pwd)/help/     $HOME/help
ln -s $(pwd)/scripts/  $HOME/scripts
ln -s $(pwd)/set-up.sh $HOME/.set-up.sh
ln -s $(pwd)/btop      $HOME/.config/btop
ln -s $(pwd)/kitty     $HOME/.config/kitty
ln -s $(pwd)/nvim      $HOME/.config/nvim

# Sway / Hyprland
ln -s $(pwd)/waybar  $HOME/.config/waybar
ln -s $(pwd)/wlogout $HOME/.config/wlogout
ln -s $(pwd)/wofi    $HOME/.config/wofi
ln -s $(pwd)/sway    $HOME/.config/sway
ln -s $(pwd)/hypr    $HOME/.config/hypr

# Arch
ln -s $(pwd)/paru    $HOME/.config/paru

# NixOs
sudo ln -s $(pwd)/nixos/configuration.nix /etc/nixos/configuration.nix
sudo ln -s $(pwd)/nixos/hardware-configuration.nix  /etc/nixos/hardware-configuration.nix

# Old
ln -s $(pwd)/i3      $HOME/.config/i3
ln -s $(pwd)/tmux    $HOME/.config/tmux
ln -s $(pwd)/zathura $HOME/.config/zathura

# Gnome
dconf load / <$(pwd)/dconf-settings.ini # load settings
dconf dump / >$(pwd)/dconf-settings.ini # save settings
sudo cp /home/gabri/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml

# Snapper (only for home directory, change the first part for root)
sudo umount /home/.snapshots
sudo rmdir /home/.snapshots
sudo snapper -c home create-config /home
sudo btrfs subvolume delete /home/.snapshots
sudo mount -av
sudo mv    /etc/snapper/configs                         /etc/snapper/configs.bk
sudo mv    /lib/systemd/system/snapper-timeline.timer   /lib/systemd/system/snapper-timeline.timer.bk
sudo mv    /lib/systemd/system/snapper-boot.timer       /lib/systemd/system/snapper-boot.timer.bk
sudo mv    /lib/systemd/system/snapper-cleanup.timer    /lib/systemd/system/snapper-cleanup.timer.bk
sudo ln -s $(pwd)/snapper/configs                       /etc/snapper/configs
sudo ln -s $(pwd)/snapper/system/snapper-timeline.timer /lib/systemd/system/snapper-timeline.timer
sudo ln -s $(pwd)/snapper/system/snapper-boot.timer     /lib/systemd/system/snapper-boot.timer
sudo ln -s $(pwd)/snapper/system/snapper-cleanup.timer  /lib/systemd/system/snapper-cleanup.timer

# Hyprland on Debian-testing (hope it will be useless in a short period of time: it is on unstable!)
sudo nala install libpugixml-dev libzip-dev librsvg2-dev libtomlplusplus-dev libghc-gi-pango-dev \
                  libxcb-errors-dev build-essential git ninja-build meson libhyprlang-dev hyprpaper \
                  libxcursor-dev
sudo apt-get build-dep wlroots
cd $HOME/gitclone/
git clone --recursive https://github.com/hyprwm/Hyprland
git clone             https://github.com/hyprwm/hyprcursor.git
git clone             https://github.com/hyprwm/hyprwayland-scanner.git
git clone             https://github.com/hyprwm/aquamarine.git
git clone             https://github.com/hyprwm/hyprutils.git

mkdir Hyprland/dependencies
ln -s $(pwd)/hyprcursor          Hyprland/dependencies/hyprcursor
ln -s $(pwd)/hyprwayland-scanner Hyprland/dependencies/hyprwayland-scanner
ln -s $(pwd)/aquamarine          Hyprland/dependencies/aquamarine
ln -s $(pwd)/hyprutils           Hyprland/dependencies/hyprutils

# cd $HOME/gitclone/
cd    Hyprland/dependencies/hyprcursor
git   pull
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo  cmake --install build
cd    ../hyprwayland-scanner
git   pull
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo  cmake --install build
cd    ../aquamarine
git   pull
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo  cmake --install build
cd    ../hyprutils
git   pull
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo  cmake --install build

cd    ../..
git   pull
meson subprojects update --reset # ?
sudo  meson setup --reconfigure build
sudo  ninja -C build
sudo  ninja -C build install
