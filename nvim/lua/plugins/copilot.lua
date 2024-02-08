return {
    "github/copilot.vim",
    config = function ()
        vim.keymap.set('i', '<C-i>', 'copilot#Accept("<CR>")', { expr = true, silent = true, desc = 'Copilot [Y]es' })
        -- vim.keymap.set('i', '<C-o>', '<Plug>(copilot-next)', { expr = true, silent = true, desc = 'Copilot [N]ext' })
        -- vim.keymap.set('i', '<C-u>', '<Plug>(copilot-previous)', { expr = true, silent = true, desc = 'Copilot [P]revious' })
        -- vim.keymap.set('i', '<bs>q', '<Plug>(copilot-dismiss)', { expr = true, silent = true, desc = 'Copilot [E]xit' })
        vim.keymap.set('n', '<bs>r', '<cmd>Copilot restart<CR>', { silent = true, desc = 'Copilot [R]estart' })
        vim.keymap.set('n', '<bs>e', '<cmd>Copilot enable<CR>', { silent = true, desc = 'Copilot [E]nable' })
        vim.keymap.set('n', '<bs>w', '<cmd>Copilot disable<CR>', { silent = true, desc = 'Copilot Disable' })
    end
}
