return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[G]it status' })
			-- @todo: what do the following commands do?
			-- vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = '[G]it ?' })
			-- vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = '[G]it ?' })

			local fugitive_group = vim.api.nvim_create_augroup("fugitive_group", {})
			local autocmd = vim.api.nvim_create_autocmd
			autocmd("BufWinEnter", {
				group = fugitive_group,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end

					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git('push')
					end, { desc = 'Git [P]ush' }, opts)

					vim.keymap.set("n", "<leader>P", function()
						vim.cmd.Git({ 'pull', '--rebase' })
					end, { desc = 'Git [P]ull' }, opts)
				end,
			})
		end
	},

	{
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup({
				opts = {
					callbacks = { ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url },
					add_current_line_on_normal_mode = true,
					action_callback = require("gitlinker.actions").open_in_browser,
					print_url = false,
					mappings = "<leader>gy",
				},
			})
		end
	}
}
