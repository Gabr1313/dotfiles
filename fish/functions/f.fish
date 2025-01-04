function f
	set -f folders $(pwd) $HOME/ $HOME/projects/ $HOME/projects/cp/ $HOME/projects/polimi/*/ \
		$HOME/projects/dotfiles/ $HOME/projects/dotfiles/nvim/lua/ $HOME/gitclone/
	set -f selected $(find -L $folders -mindepth 1 -maxdepth 1 -type d | fzf --preview 'eza -a --icons=always --color=always {}' )
	if test -n $selected
		cd $selected
	end
end
