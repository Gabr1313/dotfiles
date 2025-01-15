return {
	'rcarriga/nvim-notify',
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})
		vim.notify = require("notify")
		vim.keymap.set('n', '<leader>fn',
			function() require('telescope').extensions.notify.notify() end ,
			{ desc = '[F]ind [N]otifications' })
	end
}
