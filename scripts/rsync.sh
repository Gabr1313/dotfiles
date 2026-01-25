#!/bin/bash

# Usage: 
# cd ~ && rsync.sh /media/gabri/gbEXT4/laptop

# In case I need to sinc to ntfs, this is the best way to mount it (less error while transferring files)
# sudo mount -t ntfs-3g /dev/<sda1> /mnt/

if [ -z "$1" ]; then
  echo "Error: missing destination directory"
  exit 1
fi

# Also compresses
# tar cvfz backup.tgz
# tar cvf --exclude-vcs backup.tgz \

# rsync -av \
rsync -a --info=progress2 --relative \
books \
certificate \
Documents \
Downloads/barenghi \
Downloads/polimiRun \
Downloads/rimborso-swerc \
nice-things-to-try \
oryx \
projects \
.clang-format \
.gitconfig \
.profile \
.ssh \
.tmux \
.txt \
.vim \
.viminfo \
.vimrc \
.bash_history \
.bash_logout \
.zsh_history \
`# others` \
bitTorrent \
Downloads \
Pictures \
Videos \
`# others, even less important` \
.local/share/fonts \
.mozilla \
.cache \
$1

# gitclone/computer_enhance \
# gitclone/glibc \
# gitclone/grub-btrfs \
# gitclone/handmade_hero \
# gitclone/musl \
# gitclone/neovim \
