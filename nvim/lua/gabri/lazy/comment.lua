return {
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup({
            comment_empty = false,
        })
        vim.keymap.set('n', 'gB', '/\\*\\/<CR>vl"_d?\\/\\*<CR>v2l"_d', { desc = '[B]lock uncomment' })
        vim.keymap.set("n", "gcm", [[<cmd>g/@comment.\?me/norm gcc<CR>]], { desc = '[C]omment [M]e' })
    end
}
