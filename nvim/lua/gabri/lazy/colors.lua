function color_my_pencil(name)
	vim.cmd.colorscheme(name)
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
end

return {
	{
		"rose-pine/neovim",
		config = function()
			require('rose-pine').setup({
				variant = "moon",
				styles = { transparency = true },
			})
			color_my_pencil("rose-pine")
			vim.api.nvim_set_hl(0, "QuickFixLine", {})
		end
	},

	{
		"catppuccin/nvim",
		config = function()
			require('catppuccin').setup({
				flavour = 'macchiato',
				transparent_background = true,
			})
			-- color_my_pencil("catppuccin")
		end
	},

	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				-- transparent_background = true,
				filter = "machine",
			})
			-- color_my_pencil("monokai-pro")
		end
	},
}
