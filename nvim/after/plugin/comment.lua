require('Comment').setup({
  comment_empty = false,
})

vim.keymap.set('n', 'gB', '/\\*\\/<CR>hv2l"_d?\\/\\*<CR>v2l"_d<C-O><C-O>', { desc = '[B]lock uncomment' })
