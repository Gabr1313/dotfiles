return {
	{
		'saghen/blink.cmp',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		version = '*',
		opts = {
			keymap = {
				['<C-c>'] = { 'show', 'hide' },                 -- completion
				['<C-n>'] = { 'show', 'select_next', 'fallback' },
				['<C-i>'] = { 'show_documentation', 'hide_documentation' }, -- info
				['<C-h>'] = { 'snippet_backward', 'fallback' },
				['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-k>'] = { 'scroll_documentation_down', 'fallback' },
				['<C-l>'] = { 'snippet_forward', 'fallback' },
				['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<tab>'] = { 'fallback' },
				['<s-tab>'] = { 'fallback' },
			},
			cmdline = {
				keymap = {
					['<C-c>'] = { 'show', 'hide' },              -- completion
					['<C-n>'] = { 'show', 'select_next', 'fallback' },
					['<C-i>'] = { 'show_documentation', 'hide_documentation' }, -- info
					['<C-h>'] = { 'snippet_backward', 'fallback' },
					['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
					['<C-k>'] = { 'scroll_documentation_down', 'fallback' },
					['<C-l>'] = { 'snippet_forward', 'fallback' },
					['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
					['<tab>'] = { 'fallback' },
					['<s-tab>'] = { 'fallback' },
				}
			},
			sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
			completion = {
				-- I don't know if this is a bug, but I really enjoy this:
				-- it display ghost_text even without menu (`menu.auto_show = false`)

				ghost_text = { enabled = true },
				list = {
					selection = {
						preselect = function(ctx) return ctx.mode == 'default' end,
						auto_insert = true,
					}
				},
				menu = {
					auto_show = false,

					-- ghost_text = { enabled = false },
					-- list = { selection = { preselect = false, auto_insert = true, } },
					-- menu = {
					-- 	auto_show = true,

					border = 'single',
					draw = {
						columns = {
							{ "kind_icon", "label", "label_description", "kind", gap = 1 },
						},
						treesitter = { 'lsp' },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = { border = 'single' }
				},
			},
			signature = {
				-- enabled = true,
				enabled = false,
				window = { border = 'single' }
			},
		},
		opts_extend = { "sources.default" }
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } }
			}
		},
		config = function(_, _)
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "rust_analyzer", "lua_ls", },
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup { capabilities = capabilities }
					end,
				},
				automatic_installation = true,
			})

			local signs = { Error = "", Info = "󰋽", Warn = "", Hint = "󱠃", }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(_, bufnr)
					---@diagnostic disable: missing-fields
					vim.diagnostic.config({ float = { border = "single", }, })
					vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", })
					vim.diagnostic.enable(false)

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[G]oto [D]eclaration' })
					vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition,
						{ buffer = bufnr, desc = '[G]oto [T]ype definition' })
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
						{ buffer = bufnr, desc = '[G]oto [I]mplementation' })

					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
					vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
						{ buffer = bufnr, desc = '[V]iew [D]iagnostic' })

					vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, desc = '[R]efe[r]ences' })
					vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action,
						{ buffer = bufnr, desc = '[C]ode [A]ction' })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })

					vim.keymap.set("n", "[d", vim.diagnostic.goto_next,
						{ buffer = bufnr, desc = 'Previous [D]iagnostic' })
					vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Next [D]iagnostic' })

					vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references,
						{ buffer = bufnr, desc = '[F]zf [R]eferences' })
					vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
						{ desc = '[F]zf [D]iagnostics' })
					vim.keymap.set('n', '<leader>fsd', require('telescope.builtin').lsp_document_symbols,
						{ buffer = bufnr, desc = '[F]zf [S]ymbols [D]ocument' })
					vim.keymap.set('n', '<leader>fsw', require('telescope.builtin').lsp_dynamic_workspace_symbols,
						{ buffer = bufnr, desc = '[F]zf [S]ymbol [W]orkspace' })

					vim.keymap.set("n", "<leader>ld",
						function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
						{ desc = '[L]sp toggle [D]iagnostic' })
					vim.keymap.set("n", "<leader>lc", vim.diagnostic.setqflist,
						{ desc = '[L]sp diagnostics quickfix list' })

					vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
					vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = '[L]sp [R]estart' })
					vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<CR>", { desc = '[L]sp [S]top' })
					vim.keymap.set("n", "<leader><leader>ls", "<cmd>LspStart<CR>", { desc = '[L]sp [S]tart' })
					---@diagnostic enable: missing-fields
				end
			})
		end,
	},
}
