# function man3
#     set cmd (find (manpath | tr ':' '\n') -type f -wholename '*/man*/*' 2>/dev/null | sed -E 's|.*/man([0-9]+)/([^/]+)\..*|\2 (\1)|' | awk '$2 == "(3)"' | fzf --preview "man {2} {1}" | awk '{print $1}')
#
#     if test -n "$cmd"
# 		command man 3 $cmd | bat -p -l man
#     end
# end
