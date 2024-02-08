-- function ColorMyPencils(color)
-- color = color or "rose-pine"
-- vim.cmd.colorscheme(color)
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.cmd [[highlight LineNr guifg=#a8a5b6 ]]
-- vim.cmd [[highlight TreesitterContextLineNumber guifg=#d8a5b6 ]]
-- vim.cmd [[highlight GitSignsAdd guibg=NONE]]
-- vim.cmd [[highlight GitSignsChange guibg=NONE]]
-- vim.cmd [[highlight GitSignsDelete guibg=NONE]]
-- end

return {
    {
        "rose-pine/neovim",
        config = function()
            require('rose-pine').setup({
                -- disable_background = true,
                -- disable_flaoat_background = true,
            })
            vim.cmd.colorscheme("rose-pine")
        end
    },

    {
        "catppuccin/nvim",
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                transparent_background = true,
            })
            -- vim.cmd("colorscheme catppuccin")
        end
    },

    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                styles = {
                    floats = "transparent",
                },
            })
            -- vim.cmd("colorscheme tokyonight")
        end
    },
}
