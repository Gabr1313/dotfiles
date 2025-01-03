if status is-interactive
	set PATH $HOME/.local/bin $HOME/.local/scripts /usr/sbin $PATH
	set EDITOR nvim
	set fish_color_command green

	set -g fish_key_bindings fish_vi_key_bindings
	bind --mode insert \cp prevd-or-backward-word
	bind --mode insert \cn nextd-or-backward-word
	bind --mode normal \cp prevd-or-backward-word
	bind --mode normal \cn nextd-or-backward-word

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
