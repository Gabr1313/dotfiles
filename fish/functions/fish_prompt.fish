	function fish_prompt --description 'Write out the prompt'
    set -f normal_color set_color normal
    set -f status_color set_color brgreen
    set -f cwd_color    set_color brblue
    set -f prompt_color set_color brmagenta
    set -f time_color   set_color yellow
    set -f hour_color   set_color brmagenta

    set -f last_status $status
    set -f prompt_status ""

    set -fq fish_prompt_pwd_dir_length
    or set -fx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -f suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -fq fish_color_cwd_root
            set -f ($cwd_color) (set_color $fish_color_cwd_root)
        end
        set -f suffix '#'
    end

    if test $last_status -ne 0
        set -f status_color (set_color $fish_color_error)
        set -f prompt_status $status_color "[" $last_status "]" ($normal_color)
    end

	set -f tmp $CMD_DURATION
	set -f seconds (math (math $tmp % 60000) / 1000)
	set -f tmp     (math -s0 $tmp / 60000)
	set -f minutes (math -s0 $tmp % 60)
	set -f tmp     (math -s0 $tmp / 60)
	set -f hours   (math -s0 $tmp % 24)
	set -f days    (math -s0 $tmp / 24)

	set -f human_time ""
	if test $days -gt 0;    set -f human_time (string join '' $human_time $days d ' ');    end
	if test $hours -gt 0;   set -f human_time (string join '' $human_time $hours h ' ');   end
	if test $minutes -gt 0; set -f human_time (string join '' $human_time $minutes m ' '); end
	set -f human_time (string join '' $human_time $seconds s)

	echo -es '\n' \
		($cwd_color) (prompt_pwd) ' ' \
		(git_prompt) \
		($time_color) $human_time ' ' \
		($hour_color) '{' (date +%X) '} ' \
		$prompt_status '\n' \
		$(fish_default_mode_prompt) \
    	($prompt_color) $suffix ' ' ($normal_color)
end

function git_prompt
    set -f vcs_color      set_color magenta
    set -f symbol_color   set_color cyan
    set -f detached_color set_color yellow
    set -f white_color    set_color white
    set -f normal_color   set_color normal
    set -f action_color   set_color -o brred

    if not command -sq git
        return
    end

    # Get the git directory for later use.
    # Return if not inside a Git repository work tree.
    if not set -f git_dir (command git rev-parse --git-dir 2>/dev/null)
        return
    end

    # Get the current action ("merge", "rebase", etc.)
		# and if there's one get the current commit hash too.
    set -f commit ''
    if set -f action (fish_print_git_action "$git_dir")
        set commit (command git rev-parse HEAD 2> /dev/null | string sub -l 7)
    end

    # Get either the branch name or a branch descriptor.
    set -f branch_detached 0
    if not set -f branch (command git symbolic-ref --short HEAD 2>/dev/null)
        set branch_detached 1
        set branch (command git describe --contains --all HEAD 2>/dev/null)
    end

    # Get the commit difference counts between local and remote.
    command git rev-list --count --left-right 'HEAD...@{upstream}' 2>/dev/null \
        | read -d \t -l status_ahead status_behind
    if test $status -ne 0
        set -f status_ahead 0
        set -f status_behind 0
    end

    # Get the stash status.
    # (git stash list) is very slow. => Avoid using it.
    set -f status_stashed 0
    if test -f "$git_dir/refs/stash"
        set -f status_stashed 1
    else if test -r "$git_dir/commondir"
        read -l commondir <"$git_dir/commondir"
        if test -f "$commondir/refs/stash"
            set -f status_stashed 1
        end
    end

    # git-status' porcelain v1 format starts with 2 letters on each line:
    #   The first letter (X) denotes the index state.
    #   The second letter (Y) denotes the working directory state.
    #
    # The following table presents the possible combinations:
    # * The underscore character denotes whitespace.
    # * The cell values stand for the following file states:
    #   a: added
    #   d: deleted
    #   m: modified
    #   r: renamed
    #   u: unmerged
    #   t: untracked
    # * Cells with more than one letter signify that both states
    #   are simultaneously the case. This is possible since the git index
    #   and working directory operate independently of each other.
    # * Cells which are empty are unhandled by this code.
    # * T (= type change) is undocumented.
    #   See Git v1.7.8.2 release notes for more information.
    #
    #   \ Y→
    #  X \
    #  ↓  | A  | C  | D  | M  | R  | T  | U  | X  | B  | ?  | _
    # ----+----+----+----+----+----+----+----+----+----+----+----
    #  A  | u  |    | ad | am | r  | am | u  |    |    |    | a
    #  C  |    |    | ad | am | r  | am | u  |    |    |    | a
    #  D  |    |    | u  | am | r  | am | u  |    |    |    | a
    #  M  |    |    | ad | am | r  | am | u  |    |    |    | a
    #  R  | r  | r  | rd | rm | r  | rm | ur | r  | r  | r  | r
    #  T  |    |    | ad | am | r  | am | u  |    |    |    | a
    #  U  | u  | u  | u  | um | ur | um | u  | u  | u  | u  | u
    #  X  |    |    |    | m  | r  | m  | u  |    |    |    |
    #  B  |    |    |    | m  | r  | m  | u  |    |    |    |
    #  ?  |    |    |    | m  | r  | m  | u  |    |    | t  |
    #  _  |    |    | d  | m  | r  | m  | u  |    |    |    |
    set -f porcelain_status (command git status --porcelain 2>/dev/null | string sub -l2)

    set -f status_added 0
    if string match -qr '[ACDMT][ MT]|[ACMT]D' $porcelain_status
        set -f status_added 1
    end
    set -f status_deleted 0
    if string match -qr '[ ACMRT]D' $porcelain_status
        set -f status_deleted 1
    end
    set -f status_modified 0
    if string match -qr '[MT]$' $porcelain_status
        set -f status_modified 1
    end
    set -f status_renamed 0
    if string match -qe R $porcelain_status
        set -f status_renamed 1
    end
    set -f status_unmerged 0
    if string match -qr 'AA|DD|U' $porcelain_status
        set -f status_unmerged 1
    end
    set -f status_untracked 0
    if string match -qe '\?\?' $porcelain_status
        set -f status_untracked 1
    end

    set_color -o

    echo -ns ($vcs_color) '('

    if test -n "$branch"
        if test $branch_detached -ne 0
			$detached_color
        else
			$white_color
        end
        echo -n "$branch"
    end
    if test -n "$commit"
        echo -ns ' ' ($white_color) "$commit"
    end
    if test -n "$action"
        echo -ns ($white_color) ':' ($action_color) "$action"
    end

    if test $status_ahead -ne 0
			echo -ns ($symbol_color) '⇡'
    end
    if test $status_behind -ne 0
			echo -ns ($symbol_color) '⇣'
    end
    if test $status_stashed -ne 0
        echo -n ($symbol_color) '#'
    end

    if test $status_added -ne 0 || test $status_deleted -ne 0 || test $status_modified -ne 0 \
		|| test $status_renamed -ne 0 || test $status_unmerged -ne 0 || test $status_untracked -ne 0
        echo -ns ($symbol_color) '*'
    end

    echo -ns ($vcs_color) ') '

	$normal_color
end
