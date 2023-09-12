require('nvim-treesitter.configs').setup {
    ensure_installed = { "cpp", "python", "c", "lua", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { 'python' } },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
}

require 'treesitter-context'.setup {
    enable = false,
    max_lines = -1,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
}

vim.keymap.set('n', '<leader>oc', '<cmd>TSContextToggle<CR>', { desc = '[O]ption [C]ontext toggle' })
