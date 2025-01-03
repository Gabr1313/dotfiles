function fish_default_mode_prompt --description 'Display vi prompt mode'
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case insert
                set_color --bold white
                echo '[I]'
                # echo 'I'
            case default
                set_color --bold red
                echo '[N]'
                # echo 'N'
            case replace_one
                set_color --bold red
                echo '[N]'
                # echo 'N'
            case replace
                set_color --bold yellow
                echo '[R]'
                # echo 'R'
            case visual
                set_color --bold green
                echo '[V]'
                # echo 'V'
        end
        set_color normal
    end
end
