require('Comment').setup({
  comment_empty = false,
  toggler = {
    ---Line-comment toggle keymap
    line = 'gC',
    ---Block-comment toggle keymap
    block = 'gB',
  },
})

require('Comment').setup({
  comment_empty = false,
})

vim.keymap.set('n', '<leader>cu', '/\\*\\/<CR>hv2l"_d?\\/\\*<CR>v2l"_d<cmd>noh<CR>', { desc = '[C] [U]ncomment' })
