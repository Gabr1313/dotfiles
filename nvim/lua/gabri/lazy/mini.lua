return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		-- vim.keymap.set('n', 'gB', '/\\*\\/<CR>vl"_d?\\/\\*<CR>v2l"_d', { desc = '[B]lock uncomment' })
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
				line_left = '<C-h>',
				line_right = '<C-l>',
				line_down = '<C-j>',
				line_up = '<C-k>',
			},
		})
	end,
}
