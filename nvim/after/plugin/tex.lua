vim.g['tex_flavor'] = 'latex'
vim.g['vimtex_view_general_viewer'] = 'zathura'
vim.g['vimtex_quickfix_mode'] = 0
vim.g['vimtex_view_automatic'] = 0
vim.g['vimtex_mappings_enabled'] = 0
vim.g['vimtex_compiler_latexmk'] = {
	aux_dir = '',
	out_dir = '',
	callback = 1,
	continuous = 0,
	executable = 'latexmk',
	hooks = {},
	options = {
		'-verbose',
		'-file-line-error',
		'-synctex=1',
		'-interaction=nonstopmode',
	},
}

-- see also nvim/after/plugin/lsp.lua for snippet
-- see also nvim/after/ft/plugin/tex.lua for keymaps
