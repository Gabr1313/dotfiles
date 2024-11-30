# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER="$HOME/.local/share/AppImage/ZenBrowser.AppImage"
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/scripts/":$PATH
export PATH="/usr/sbin/":$PATH
export EDITOR="nvim"

fpath+=($HOME/.oh-my-zsh/custom/themes/pure/)
autoload -U promptinit; promptinit
prompt pure
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled      # auto, disabled, reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    dirhistory
    fzf
    # custom
    zsh-syntax-highlighting
    zsh-autosuggestions
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export XDG_CONFIG_HOME="$HOME/.config"
export MAN_POSIXLY_CORRECT=""

# qt6 style
export export QT_QPA_PLATFORMTHEME=gtk3

# For a full list of active aliases, run `alias`.
alias v='$EDITOR'
alias f='. $HOME/.local/scripts/cd-fzf'      # find dir
alias fr='. $HOME/.local/scripts/cd-fzf-rec' # find dir  recursive
alias ff='find | fzf'                        # find file
alias fe='find | fzf | xargs -r $EDITOR'     # find file and edit
alias update='sudo nala update && sudo nala upgrade --full -y'

if command -v eza &> /dev/null ; then
  alias ls='eza --icons --group-directories-first'
  alias tree='eza --tree --icons --group-directories-first'
fi

if command -v batcat &> /dev/null ; then
  alias bat='batcat'
fi
alias cat='bat -pp'

cd () { # ls after cd
  if [ -n "$1" ]; then
    builtin cd "$@" && ls -a
  else
    builtin cd ~ && ls -a
  fi
}

# bindkey -v   # use vim commands on terminal
# KEYTIMEOUT=1 # min delay pressing ESC 
bindkey "^Y" dirhistory_zle_dirhistory_up
bindkey "^N" dirhistory_zle_dirhistory_future
bindkey "^P" dirhistory_zle_dirhistory_back

HISTSIZE=16384
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
