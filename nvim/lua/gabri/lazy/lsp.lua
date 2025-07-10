return {
	{
		'saghen/blink.cmp',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		version = '*',
		-- version = 'v0.12.4', -- update this. I need a bit of stability
		opts = {
			keymap = {
				['<C-e>'] = { 'show', 'hide', 'fallback' }, -- completion
				['<C-n>'] = { 'show', 'select_next', 'fallback' },
				['<C-p>'] = { 'show', 'select_prev', 'fallback' },
				['<C-i>'] = { 'show_documentation', 'hide_documentation', 'fallback' }, -- info
				['<C-h>'] = { 'snippet_backward', 'fallback' },
				['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-k>'] = { 'scroll_documentation_down', 'fallback' },
				['<C-l>'] = { 'snippet_forward', 'fallback' },
				['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<C-y>'] = { 'select_and_accept', 'fallback' },

				['<down>']    = { 'fallback' },
				['<up>']      = { 'fallback' },
				['<C-b>']     = { 'fallback' },
				['<C-f>']     = { 'fallback' },
				['<tab>']     = { 'fallback' },
				['<S-tab>']   = { 'fallback' },
				['<C-space>'] = { 'fallback' },
			},
			cmdline = {
				keymap = {
                    preset = 'default',
					['<C-e>'] = { 'show', 'hide', 'fallback' }, -- completion
					['<C-n>'] = { 'show', 'select_next', 'fallback' },
					['<C-p>'] = { 'show', 'select_prev', 'fallback' },
					['<C-h>'] = { 'snippet_backward', 'fallback' },
					['<C-l>'] = { 'snippet_forward', 'fallback' },
                    ['<Tab>'] = { 'fallback' },
                    ['<S-Tab>'] = { 'fallback' },
				},
			},
			sources = { default = { 'buffer', 'omni', 'lsp', 'path', 'snippets' }, },
			completion = {
				-- I don't know if this is a bug, but I really enjoy this:
				-- it display ghost_text even without menu (`menu.auto_show = false`)

				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
				list = {
					selection = {
						preselect = function(ctx) return ctx.mode == 'default' end,
						auto_insert = false,
					}
				},
				menu = {
					auto_show = false,
					border = 'single',
					draw = {
						columns = {
							{ "label", "label_description", "kind", gap = 1 },
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
		opts_extend = { "sources.default" },
        fuzzy = {
            fuzzy = { 
                implementation = "rust",
            },
            prebuilt_binaries = {
                download = true,
            },
        },
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
            -- "mason-org/mason.nvim",
            -- "mason-org/mason-lspconfig.nvim",
            { "mason-org/mason.nvim", version = "^1.0.0" },
            { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
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

					vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
						{ buffer = bufnr, desc = 'Previous [D]iagnostic' })
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Next [D]iagnostic' })

					vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references,
						{ buffer = bufnr, desc = '[F]ind [R]eferences' })
					vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
						{ desc = '[F]ind [D]iagnostics' })
					vim.keymap.set('n', '<leader>fsd', require('telescope.builtin').lsp_document_symbols,
						{ buffer = bufnr, desc = '[F]ind [S]ymbols [D]ocument' })
					vim.keymap.set('n', '<leader>fsw', require('telescope.builtin').lsp_dynamic_workspace_symbols,
						{ buffer = bufnr, desc = '[F]ind [S]ymbol [W]orkspace' })

					vim.keymap.set("n", "<leader>ld",
						function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
						{ desc = '[L]sp toggle [D]iagnostic' })
					vim.keymap.set("n", "<leader>lc", vim.diagnostic.setqflist,
						{ desc = '[L]sp diagnostics quickfix list' })

					vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
					vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>" , { desc = '[L]sp [R]estart' })
					vim.keymap.set("n", "<leader>lt", function()
						local clients = vim.lsp.get_active_clients({ bufnr = 0 })
						if #clients > 0 then
							vim.cmd("LspStop")
							print("LSP stopped")
						else
							vim.cmd("LspStart")
							print("LSP started")
						end
					end , { desc = '[L]sp [T]oggle' })
					---@diagnostic enable: missing-fields
				end
			})
		end,
	},
}
