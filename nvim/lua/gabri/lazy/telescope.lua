return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require('telescope').setup({
			defaults = {
				layout_strategy = 'vertical',
				layout_config = { width = 0.95, height = 0.95 },
			},
			extensions = { fzf = {} },
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})
		require("telescope").load_extension('fzf')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>fo', builtin.buffers, { desc = '[F]ind [O]pened files' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it' })
		vim.keymap.set('n', '<leader>fp', builtin.oldfiles, { desc = '[F]ind [P]revious (recently opened) files' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fl', builtin.resume, { desc = '[F]ind [L]ast searched' })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[F]ind [C]urrent word' })
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = '[F]ind [W]ord' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = '[F]ind [J]ump list' })
		vim.keymap.set('n', '<leader>fss', builtin.spell_suggest, { desc = '[F]ind [S]pell [S]uggest' })
		vim.keymap.set('n', '<leader>fe', function()
			builtin.find_files { cwd = vim.fn.stdpath("config") }
		end, { desc = '[F]ind [E]dit config' })

        vim.keymap.set('n', '<leader>fx', function()
            builtin.find_files({
                find_command = {'find', '-type', 'd'},
                prompt_title = 'Select Directory',
                attach_mappings = function(prompt_bufnr, map)
                    local actions = require('telescope.actions')
                    local action_state = require('telescope.actions.state')
                    map('i', '<CR>', function()
                        local entry = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        if entry then
                            builtin.live_grep({ search_dirs = {entry.value} })
                        end
                    end)
                    return true
                end
            })
        end, {desc = '[F]ind directory, then word in it'})
    end
}
