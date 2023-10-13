vim.api.nvim_set_keymap('i', '<A-y>', 'copilot#Accept("<CR>")',
    { expr = true, silent = true, desc = 'Copilot [Y]es' })
vim.keymap.set('i', '<A-p>', '<Plug>(copilot-previous)'
, { expr = true, silent = true, desc = 'Copilot [P]revious' })
vim.keymap.set('i', '<A-n>', '<Plug>(copilot-next)'
, { expr = true, silent = true, desc = 'Copilot [N]ext' })
vim.keymap.set('i', '<A-e>', '<Plug>(copilot-dismiss)'
, { expr = true, silent = true, desc = 'Copilot [E]xit' })
vim.keymap.set({ 'n', 'i' }, '<A-r>', '<cmd>Copilot restart<CR>'
, { silent = true, desc = 'Copilot [R]estart' })
vim.keymap.set({ 'n', 'i' }, '<A-d>', '<cmd>Copilot disable<CR>'
, { silent = true, desc = 'Copilot [D]estart' })
vim.keymap.set({ 'n', 'i' }, '<A-e>', '<cmd>Copilot enable<CR>'
, { silent = true, desc = 'Copilot [E]nable' })
