if status is-interactive
	set PATH $HOME/.local/bin $HOME/.local/scripts /usr/sbin $PATH
	set EDITOR nvim
	set fish_color_command green

	set -g fish_key_bindings fish_vi_key_bindings
	# previous directory
	bind --mode default \cb prevd-or-backward-word
	bind --mode insert  \cb prevd-or-barkward-word
	bind --mode visual  \cb prevd-or-backward-word
	# forward directory
	bind --mode default \cf nextd-or-forward-word
	bind --mode insert  \cf nextd-or-forward-word
	bind --mode visual  \cf nextd-or-forward-word
	# parent directory
	bind --mode default \co 'cd .. ; commandline -f repaint'
	bind --mode insert  \co 'cd .. ; commandline -f repaint'
	bind --mode visual  \co 'cd .. ; commandline -f repaint'
	# ctrl-n as tab
	bind --mode default \cn complete
	bind --mode insert  \cn complete
	bind --mode visual  \cn complete
	# ctrl-p as shift-tab
	bind --mode default \cp complete-and-search
	bind --mode insert  \cp complete-and-search
	bind --mode visual  \cp complete-and-search

	alias v='nvim'

	# see also f (quick find) and fr (quick find recursive) functions
	alias ff='find -L -type f | fzf'             # quick find file
	alias fe='find | fzf | xargs -r $EDITOR'     # quick find file and edit

	alias upgrade='sudo dnf upgrade -y'
	alias ls='eza --icons --group-directories-first'
	alias tree='eza --icons --group-directories-first --tree'
	alias cat='bat -pp'

	# ls after cd
	function __ls_after_cd --on-variable PWD; ls -a; end
end
