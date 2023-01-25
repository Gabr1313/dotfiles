# NeoVim Configuration

Higly hispired by [ThePrimeagen](https://github.com/ThePrimeagen/init.lua) 
& [KickStart](https://github.com/nvim-lua/kickstart.nvim)

In order to use this configuration you should have to:

1. Install some [Nerdfonts](https://www.nerdfonts.com/) (I use FiraCode)

2. Put them in the correct directory (/usr/share/fonts) and then:
```shell
sudo fc-cache -fv
```

3. Install neovim and utils
```shell
sudo pacman -Syu
sudo pacman -S neovim ripgrep fd python3 python-pip nodejs-lts-hydrogen npm xclip gcc
pip3 install pynvim
npm install -g neovim
```

4. Update neovim to the [latest version](https://github.com/neovim/neovim/releases)

5. Clone the directory:
```shell
git clone git@github.com:Gabr1313/nvim.git
```

6. Run dev (Achtung: it deletes all you current settings):
```shell
cd ./nvim
./createConfig.sh
```

7. Set a semi-transparent background on your terminal
(I use [Kitty](https://github.com/kovidgoyal/kitty))

8. Finally you should be ok.
