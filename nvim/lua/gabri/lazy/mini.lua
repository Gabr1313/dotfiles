return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.ai').setup { n_lines = 500 }
        require('mini.surround').setup()
        local miniclue = require('mini.clue')
        -- vim.keymap.set('n', 'gB', '/\\*\\/<CR>vl"_d?\\/\\*<CR>v2l"_d', { desc = '[B]lock uncomment' })
        miniclue.setup({
            triggers = {
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },
                { mode = 'i', keys = '<C-x>' },
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'c', keys = '<C-r>' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'n', keys = '<C-w>' },
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },
            clues = {
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
        require('mini.cursorword').setup({ delay = 0 })
        require('mini.indentscope').setup({
            draw = {
                delay = 0,
                animation = function() return 0 end
            }
        })
        require('mini.move').setup({
            mappings = {
                left = '<C-h>',
                right = '<C-l>',
                down = '<C-j>',
                up = '<C-k>',
                -- Normal mode
                -- line_left = '<M-h>',
                -- line_right = '<M-l>',
                -- line_down = '<M-j>',
                -- line_up = '<M-k>',
            },
        })
    end,
}
