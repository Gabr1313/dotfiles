-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup({
  -- show_end_of_line = true,
  char = '¦',
  -- char_highlight_list = {'Function'},
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
})
