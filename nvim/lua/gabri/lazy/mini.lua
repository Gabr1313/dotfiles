return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup { n_lines = 256 }
		-- require('mini.surround').setup() -- `s` is already used by flash
		local hipatterns = require('mini.hipatterns')
		hipatterns.setup({
			highlighters = {
				fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
				todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
				note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
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
		-- require('mini.move').setup({
		-- 	mappings = {
		-- 		left = '<M-h>',
		-- 		right = '<M-l>',
		-- 		down = '<M-j>',
		-- 		up = '<M-k>',
		-- 		line_left = '<M-h>',
		-- 		line_right = '<M-l>',
		-- 		line_down = '<M-j>',
		-- 		line_up = '<M-k>',
		-- 	},
		-- })
		require('mini.splitjoin').setup({
			mappings = { toggle = 'gs', },
		})
	end,
}
