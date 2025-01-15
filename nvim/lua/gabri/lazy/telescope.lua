return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	config = function()
		require('telescope').setup({
			defaults = {
				layout_strategy = 'vertical',
				layout_config = { width = 0.95, height = 0.95 },
			},
			extensions = { fzf = {} }
		})
		require("telescope").load_extension('fzf')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffer' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fe', function()
			builtin.find_files { cwd = vim.fn.stdpath("config") }
		end, { desc = '[F]ind [E]dit config' })
		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it' })
		vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld (recently opened) files' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fl', builtin.resume, { desc = '[F]ind [L]ast searched' })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[F]ind [C]urrent word' })
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = '[F]ind [W]ord' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = '[F]ind [J]ump list' })
		vim.keymap.set('n', '<leader>fss', builtin.spell_suggest, { desc = '[F]ind [S]pell [S]uggest' })
	end
}
