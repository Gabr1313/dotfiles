# VCS
YS_VCS_PROMPT_PREFIX1="%{$reset_color%}%{$fg[blue]%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local exit_code="%(?,,E:%{$fg[red]%}%?%{$reset_color%} )"

function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    hrs=$(printf "%02d" $(($elapsed/3600000)))
    min=$(printf "%02d" $(($elapsed/60000%60)))
    sec=$(printf "%02d" $(($elapsed/1000%60)))
    mil=$(printf "%03d" $(($elapsed%1000)))
    if [ $hrs -gt 0 ]; then
      elapsed="${hrs}:${min}"
    elif [ $min -gt 0 ]; then
      elapsed="${min}:${sec}"
    elif [ $sec -gt 0 ]; then
      elapsed="${sec}.${mil}"
    else
      elapsed=".${mil}"
    fi
    time_info="[${elapsed}%{$reset_color%}]"
PROMPT="
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info} $exit_code\
${time_info}
%{$terminfo[bold]$fg[white]%}❯ %{$reset_color%}"
    unset timer
  else 
PROMPT="
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info} $exit_code
%{$terminfo[bold]$fg[white]%}❯ %{$reset_color%}"
  fi
}
