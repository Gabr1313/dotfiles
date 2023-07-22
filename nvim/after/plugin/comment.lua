require('Comment').setup({
    comment_empty = false,
})

vim.keymap.set('n', 'gB', '/\\*\\/<CR>vl"_d?\\/\\*<CR>v2l"_d', { desc = '[B]lock uncomment' })
