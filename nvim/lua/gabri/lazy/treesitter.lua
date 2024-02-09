return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "python", "bash", "lua", "vim", "vimdoc", "go", "rust" },
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "latex" },
                    -- additional_vim_regex_highlighting = { "markdown" },
                },
                indent = {
                    enable = true,
                    disable = { "python" },
                },
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
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                max_lines = 6,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
                zindex = 20,
            })
            --       vim.keymap.set('n', '<leader>oc', '<cmd>TSContextToggle<CR>', { desc = '[O]ption [C]ontext toggle' })
        end
    }
}
