return {
    'RRethy/vim-illuminate',
    config = function()
        require('illuminate').configure({
            -- providers = {
            --     'lsp',
            --     'treesitter',
            --     'regex',
            -- },
            -- under_cursor = true,
            delay = 0,
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
    end
}
