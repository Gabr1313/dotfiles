require('Comment').setup({
  comment_empty = false,
})

vim.keymap.set('n', '<leader>cu', '/\\*\\/<CR>hv2l"_d?\\/\\*<CR>v2l"_d<cmd>noh<CR>', { desc = '[C] [U]ncomment' })
