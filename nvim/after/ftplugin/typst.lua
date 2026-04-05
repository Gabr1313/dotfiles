---@diagnostic disable: missing-fields
vim.keymap.set("n", "<BS>c", "<cmd>w<CR><cmd>!typst compile %<CR>", { desc = 'Typst [C]ompile' })
---@diagnostic enable: missing-fields
