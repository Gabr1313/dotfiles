function fr
	set -f folders $(pwd)
	set -f selected $(find -L $folders -mindepth 1 -type d | fzf)
	if test -n $selected
		cd $selected
	end
end