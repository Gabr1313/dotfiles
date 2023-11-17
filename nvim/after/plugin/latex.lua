vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_quickfix_mode'] = 0
vim.g['vimtex_mappings_enabled'] = 0
vim.g['vimtex_indent_enabled'] = 0
vim.g['vimtex_syntax_enabled'] = 1
vim.g['vimtex_context_pdf_viewer'] = 'xreader'
-- vim.g['vimtex_complete_enabled'] = 1
-- vim.g['vimtex_compiler_progname'] = 'nvr'
-- vim.g['vimtex_complete_close_braces'] = 1
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
		'-pdf',
	},
}

vim.g['tex_flavor'] = 'latex'

local function toggle_conceallevel()
	if vim.wo.conceallevel == 0 then
		vim.wo.conceallevel = 2
	else
		vim.wo.conceallevel = 0
	end
end

vim.keymap.set("n", ",c", "<cmd>w<CR><cmd>VimtexCompile<CR>", { desc = '' })
vim.keymap.set("v", ",c", "<cmd>VimtexCompileSelected<CR><CR>", { desc = '' })
vim.keymap.set("n", ",s", "<cmd>w<CR><cmd>VimtexStop<CR>", { desc = '' })
vim.keymap.set("n", ",e", "<cmd>w<CR><cmd>VimtexErrors<CR>", { desc = '' })
vim.keymap.set("n", ",v", "<cmd>w<CR><cmd>VimtexView<CR>", { desc = '' })
vim.keymap.set("n", ",l", toggle_conceallevel, { desc = '' })

-- see also lsp.lua the snippet
