return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("hardtime").setup()
			vim.keymap.set("n", "<leader>h", "<cmd>Hardtime toggle<CR>", { desc = '[H]ardtime Toggle' })
		end,
	},
}
