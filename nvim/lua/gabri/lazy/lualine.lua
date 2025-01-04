return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup({
				options = {
					theme = 'auto',
					-- section_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					component_separators = { left = '|', right = '|' },
					-- component_separators = { left = '', right = ''},
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', { 'diagnostics', symbols = { error = '', warn = '', info = '', hint = '' } } },
					lualine_c = { 'filename' },
					-- lualine_x = {'encoding', {'fileformat'}, 'filetype'},
					lualine_x = { 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
			})
		end
	},
}
