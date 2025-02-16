if status is-interactive
	set PATH $PATH $HOME/.local/bin $HOME/.local/scripts /usr/sbin $HOME/gitclone/Odin
	set EDITOR nvim

	set fish_color_command white # green 
	set fish_color_param white # cyan
	# set -gx BAT_THEME 'Catppuccin Macchiato'

	# ls after cd
	functions --copy cd _cd
	function cd; _cd $argv && ls -a; end

	# better man
	function man; command man $argv | bat -p -l man; end

	set -g fish_key_bindings fish_vi_key_bindings
	# previous directory (currently `ls after cd` is bugged with repaint)
	bind --mode default \cb prevd-or-backward-word
	bind --mode insert  \cb prevd-or-backward-word
	bind --mode visual  \cb prevd-or-backward-word
	# forward directory (currently `ls after cd` is bugged with repaint)
	bind --mode default \cf nextd-or-forward-word
	bind --mode insert  \cf nextd-or-forward-word
	bind --mode visual  \cf nextd-or-forward-word
	# parent directory (currently `ls after cd` is bugged with repaint)
	bind --mode default \cg '_cd .. ; commandline -f repaint'
	bind --mode insert  \cg '_cd .. ; commandline -f repaint'
	bind --mode visual  \cg '_cd .. ; commandline -f repaint'
	# ctrl-n as tab
	bind --mode default \cn complete
	bind --mode insert  \cn complete
	bind --mode visual  \cn complete
	# ctrl-p as shift-tab
	bind --mode default \cp complete-and-search
	bind --mode insert  \cp complete-and-search
	bind --mode visual  \cp complete-and-search
	# ctrl-c for accepting them
	bind --mode default \cy accept-autosuggestion
	bind --mode insert  \cy accept-autosuggestion

	alias odin='~/gitclone/Odin/odin'

	alias v='nvim'

	alias upgrade='sudo dnf upgrade -y'
	alias ls='eza --icons --group-directories-first'
	alias tree='eza --icons --group-directories-first --tree'
	alias cat='bat -pp'

	# see also functions `f` (quick find) and `fr` (quick find recursive)
	# quick find file
	alias ff='find -L -type f | fzf --preview \'bat --style=numbers --color=always --line-range :256 {}\''
	# quick find file and edit
	alias fe='find | fzf --preview \'bat --style=numbers --color=always --line-range :256 {}\'| xargs -r $EDITOR'
end
