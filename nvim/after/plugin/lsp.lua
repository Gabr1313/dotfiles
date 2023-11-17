local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'clangd',
	'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local luasnip = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-l>'] = cmp.mapping.complete(),
	['<C-k>'] = cmp.mapping.scroll_docs(-4),
	['<C-j>'] = cmp.mapping.scroll_docs(4),
	['<Tab>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif luasnip.expandable() then
			luasnip.expand()
		else
			fallback()
		end
	end, { "i", "s", }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s", }),
})

cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = {
		error = '✘',
		warn = '▲',
		hint = '󱠃',
		info = ''
	}
})

lsp.on_attach(function(_, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })
	vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = '[C]ode [A]ction' })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[G]oto [D]eclaration' })
	vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, { buffer = bufnr, desc = '[T]ype [D]efinition' })
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = '[G]oto [I]mplementation' })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = '[V]iew [D]iagnostic' })
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, desc = '[R]efe[r]ences' })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Previous [D]iagnostic' })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Next [D]iagnostic' })
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Help' })

	vim.keymap.set('n', 'fr', require('telescope.builtin').lsp_references,
		{ buffer = bufnr, desc = '[F]zf [R]eferences' })
	vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]zf [D]iagnostics' })
	vim.keymap.set('n', '<leader>fsd', require('telescope.builtin').lsp_document_symbols,
		{ buffer = bufnr, desc = '[F]zf [S]ymbols [D]ocument' })
	vim.keymap.set('n', '<leader>fsw', require('telescope.builtin').lsp_dynamic_workspace_symbols,
		{ buffer = bufnr, desc = '[F]zf [S]ymbol [W]orkspace' })
end)

lsp.setup()

vim.opt.completeopt = 'menu,menuone,preview'

vim.diagnostic.config({
	virtual_text = true,
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = '[L]sp [R]estart' })

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node

local function copy(args)
	return args[1]
end

luasnip.add_snippets("tex", {
	s( -- begin
		"beg",
		{ t({ "\\begin{" }), i(1), t({ "}", "\t" }), i(0), t({ "", "\\end{" }), f(copy, 1), t({ "}" }), }
	),
	s( -- dispaly mathk
		"dm",
		{ t({ "\\[", "" }), i(0), t({ "", ".\\]" }), }
	),
	s( -- subscript
		{ trig = "([A-Za-z])_(%d%d)", regTrig = true },
		f(function(_, snip) return snip.captures[1] .. "_{" .. snip.captures[2] .. "}" end, {})
	),
	s( -- superscript
		{ trig = "([A-Za-z])^(%d%d)", regTrig = true },
		f(function(_, snip) return snip.captures[1] .. "^{" .. snip.captures[2] .. "}" end, {})
	),
	s( -- fraction
		"//",
		{ t({ "\\frac{" }), i(1), t({ "}{" }), i(2), t({ "}" }), i(0), }
	),
	s( -- fraction digit
		{ trig = "(%d*)/", regTrig = true },
		{ f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" end, {}), i(1), t({ "}" }), i(0), }
	),
	s( -- fraction ()
		{ trig = "%((.*)%)/", regTrig = true },
		{ f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" end, {}), i(1), t({ "}" }), i(0), }
	),
	s( -- overline
		{ trig = "([A-Za-z]),o", regTrig = true },
		{ f(function(_, snip) return "\\overline{" .. snip.captures[1] .. "}" end, {}), }
	),
	s( -- hat
		{ trig = "([A-Za-z]),h", regTrig = true },
		{ f(function(_, snip) return "\\hat{" .. snip.captures[1] .. "}" end, {}), }
	),
	s( -- vec
		{ trig = "([A-Za-z]),v", regTrig = true },
		{ f(function(_, snip) return "\\vec{" .. snip.captures[1] .. "}" end, {}), }
	),
}, {
	type = "autosnippets",
	key = "tex",
})
