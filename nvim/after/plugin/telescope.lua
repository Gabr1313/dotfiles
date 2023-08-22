require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]zf [B]uffer' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]zf [F]iles' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]zf [O]ld (recently opened) files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Fzf [G]it [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]zf [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]zf current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]zf by [G]rep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]zf [K]eymaps' })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = '[F]zf [C]olorscheme' })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = '[F]zf [J]ump list' })
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, { desc = '[F]zf [S]pell suggest' })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = '[F]zf [R]egisters' })
