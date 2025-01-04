return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		require('mini.hipatterns').setup()
		local hipatterns = require('mini.hipatterns')
		hipatterns.setup({
			highlighters = {
				fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack      = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
				todo      = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
				note      = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
		-- vim.keymap.set('n', 'gB', '/\\*\\/<CR>vl"_d?\\/\\*<CR>v2l"_d', { desc = '[B]lock uncomment' })
		local miniclue = require('mini.clue')
		miniclue.setup({
			triggers = {
				{ mode = 'n', keys = '<Leader>' }, { mode = 'x', keys = '<Leader>' },
				{ mode = 'i', keys = '<C-x>' },
				{ mode = 'n', keys = 'g' }, { mode = 'x', keys = 'g' },
				{ mode = 'n', keys = "'" }, { mode = 'x', keys = "'" },
				{ mode = 'n', keys = '`' }, { mode = 'x', keys = '`' },
				{ mode = 'n', keys = '"' }, { mode = 'x', keys = '"' },
				{ mode = 'c', keys = '<C-r>' }, { mode = 'i', keys = '<C-r>' },
				{ mode = 'n', keys = '<C-w>' },
				{ mode = 'n', keys = 'z' }, { mode = 'x', keys = 'z' },
			},
			clues = {
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = { delay = 500, }
		})
		require('mini.indentscope').setup({
			draw = { delay = 0, animation = function() return 0 end }
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
