#!/bin/bash

# Usage:
# cd ~ && tar.sh backup.tgz

if [ -z "$1" ]; then
  echo "Error: missing filename.tgz"
  exit 1
fi

# Also compresses
# tar cvfz backup.tgz
# tar cvf --exclude-vcs backup.tgz \

tar cvf $1 \
books \
certificate \
cp-books \
Documents \
Downloads/barenghi \
Downloads/polimiRun \
Downloads/rimborso-swerc \
Pictures/polimiRun \
Pictures/swerc \
Pictures/zurich \
nice-things-to-try \
oryx \
tar.sh \
rsync.sh \
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
# bitTorrent \
# Downloads \
# Pictures \
# Videos \
# `# others, even less important` \
# .local/share/fonts \
# .mozilla \
# .cache \
# gitclone/computer_enhance \
# gitclone/gf \
# gitclone/glfw \
# gitclone/glibc \
# gitclone/grub-btrfs \
# gitclone/handmade_hero \
# gitclone/musl \
# gitclone/neovim \
# gitclone/Vulkan
