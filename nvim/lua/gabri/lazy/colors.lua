-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.cmd [[highlight LineNr guifg=#a8a5b6 ]]
-- vim.cmd [[highlight TreesitterContextLineNumber guifg=#d8a5b6 ]]
-- vim.cmd [[highlight GitSignsAdd guibg=NONE]]
-- vim.cmd [[highlight GitSignsChange guibg=NONE]]
-- vim.cmd [[highlight GitSignsDelete guibg=NONE]]

return {
	{
		"rose-pine/neovim",
		config = function()
			require('rose-pine').setup({
				disable_background = true,
				disable_float_background = true,
			})
			-- vim.cmd.colorscheme("rose-pine")
		end
	},

	{
		"catppuccin/nvim",
		config = function()
			require('catppuccin').setup({
				flavour = 'macchiato',
				transparent_background = true,
			})
			vim.cmd("colorscheme catppuccin")
		end
	},

	{
		"polirritmico/monokai-nightasty.nvim",
		config = function()
			require('monokai-nightasty').setup({
				dark_style_background = "transparent",
				hl_styles = {
					floats = "transparent",
					sidebars = "transparent",
				},
				on_colors = function(colors)
					colors.bg_highlight = "#282828"
					colors.bg_statusline = "#282828"
				end
			})
			-- vim.cmd("colorscheme monokai-nightasty")
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
	}
}
