function fish_vi_cursor --on-variable fish_bind_mode
	switch $fish_bind_mode
		case insert
			echo -en "\e[6 q" # line cursor
		case default
			echo -en "\e[2 q" # block cursor
		case replace_one
			echo -en "\e[4 q" # block cursor
		case replace
			echo -en "\e[4 q" # block cursor
		case visual
			echo -en "\e[2 q" # block cursor
	end
end
