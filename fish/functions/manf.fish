# function manf
#     set selection (find (manpath | tr ':' '\n') -type f -wholename '*/man*/*' 2>/dev/null | sed -E 's|.*/man([0-9]+)/([^/]+)\..*|\2 (\1)|' | fzf --preview "man {2} {1}")
#     
#     if test -n "$selection"
#         set cmd (echo $selection | awk '{print $1}')
#         set section (echo $selection | awk -F '[()]' '{print $2}')
#         man $section $cmd
#     end
# end
