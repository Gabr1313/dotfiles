# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Only run in interactive shells
[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts:/usr/sbin:$HOME/gitclone/Odin"
export EDITOR="nvim"

######## MISCELLANEOUS ########

# Ctrl-S and Ctrl-Q works normally
stty -ixon

# don't put duplicate lines or lines starting with space in the history. (See bash(1) for more options)
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=16384
HISTFILESIZE=16384

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

######## ALIASES ########

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if command -v exa >/dev/null 2>&1; then
    alias eza='exa'
fi

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons --group-directories-first'
    alias tree='eza --icons --group-directories-first --tree'
fi

if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

if command -v bat >/dev/null 2>&1; then
    alias cat='bat -pp'
fi

alias ll='ls -Alh'
alias l='ls -CF'
alias v='nvim'
# alias upgrade='sudo dnf upgrade -y'
alias upgrade='sudo nala update && sudo nala full-upgrade -y'
alias odin='~/gitclone/Odin/odin'

cd() {
    if builtin cd "$@"; then
        ls -a
    fi
}

alias f=". cd-fzf"      # find (directories)
alias fr=". cd-fzf-rec" # find (directories) recursively
alias ff="find -L -type f | fzf --preview \"bat --style=numbers --color=always --line-range :256 {}\""                   # quick find file
alias fe="find -L -type f | fzf --preview \"bat --style=numbers --color=always --line-range :256 {}\"| xargs -r $EDITOR" # quick find file and edit

######## PROMPT ########

RESET="\e[0m"

RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
MAGENTA="\e[0;35m"
BOLD_CYAN="\e[1;36m"
WHITE="\e[0;37m"

BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_MAGENTA="\e[1;35m"
BOLD_CYAN="\e[1;36m"
BOLD_WHITE="\e[1;37m"

CMD_START_TIME=""
CMD_DURATION=""
LAST_EXIT_CODE=""

timer_start() {
    # Skip this stupid command
    [[ "$BASH_COMMAND" == "__systemd_osc_context_precmdline" ]] && return
    # Only record if no timer is active
    if [[ -z "$CMD_START_TIME" ]]; then
        CMD_START_TIME=$(date +%s.%N)
    fi
}

timer_end() {
    LAST_EXIT_CODE=$?
    if [[ -n "$CMD_START_TIME" ]]; then
        local end_time=$(date +%s.%N)
        CMD_DURATION=$(echo "$end_time - $CMD_START_TIME" | bc)
        CMD_START_TIME=""
    fi
}

format_duration() {
    local total_ms=$(printf "%.0f" "$(echo "$1 * 1000" | bc)")
    local millis=$(printf "%03d" "$(( (total_ms % 1000) ))")
    local seconds=$(( (total_ms / 1000) % 60 ))
    local minutes=$(( (total_ms / 1000 / 60) % 60 ))
    local hours=$(( (total_ms / 1000 / 60 / 60) % 24 ))
    local days=$(( total_ms / 1000 / 60 / 60 / 24 ))

    local human_time=""
    (( days > 0 ))    && human_time+="${days}d "
    (( hours > 0 ))   && human_time+="${hours}h "
    (( minutes > 0 )) && human_time+="${minutes}m "
    (( seconds > 0 )) && human_time+="${seconds}"
    human_time+=".${millis}s"

    echo "$human_time"
}

show_exit_status() {
    [[ $LAST_EXIT_CODE -ne 0 ]] && echo -n "[$LAST_EXIT_CODE]"
}

parse_git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
        echo -e "${MAGENTA}(${BOLD_WHITE}${branch}${MAGENTA}) "
    fi
}

trap 'timer_start' DEBUG
PROMPT_COMMAND='timer_end'


# PS1="\n\
# \e[6 q\
# ${BOLD_BLUE}\w \
# \$(parse_git_branch)\
# ${YELLOW}\$(format_duration \${CMD_DURATION:-0}) \
# ${MAGENTA}{\@} \
# ${BOLD_RED}\$(show_exit_status) \
# ${RESET}\n\
# ❯ "

PS1="\n\
${BOLD_BLUE}\w \
\$(parse_git_branch)\
${YELLOW}\$(format_duration \${CMD_DURATION:-0}) \
${MAGENTA}{\@} \
${BOLD_RED}\$(show_exit_status) \
${RESET}\n\
❯ "

bind -x '"\C-b":tmux-sessionizer'
