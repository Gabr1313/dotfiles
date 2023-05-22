require("nvim-autopairs").setup()

vim.keymap.set('n', '<leader>op', '<cmd>lua require("nvim-autopairs").enable()<CR>', { desc = '[O]ption [P]air on' })
vim.keymap.set('n', '<leader>oP', '<cmd>lua require("nvim-autopairs").disable()<CR>', { desc = '[O]ption [P]air off' })
