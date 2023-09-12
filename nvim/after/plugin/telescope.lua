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
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]zf [F]iles' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]zf [O]ld (recently opened) files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]zf [H]elp' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[F]zf [C]urrent word' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = '[F]zf [W]ord' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]zf [K]eymaps' })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = '[F]zf [J]ump list' })
vim.keymap.set('n', '<leader>fss', builtin.spell_suggest, { desc = '[F]zf [S]pell [S]uggest' })
