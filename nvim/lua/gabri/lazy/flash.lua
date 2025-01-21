return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			-- search = { enabled = true },
			char = {
				-- enabled = false,
				jump_labels = false, -- `dtx` command would be ugly otherwise
				multi_line = false,
				char_actions = function(_) -- i hate that `f` does not start another search
					return { [";"] = "next", [","] = "prev", }
				end,
			},
		},
		highlight = {
			backdrop = false,
			groups = {
				match = "IncSearch",
				current = "IncSearch",
				label =  "CurSearch",
				backdrop = "", -- otherwise it color when pressing `f`
			},
		},
	},
	keys = {
		{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
		{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		{ "r",     mode = { "o" },           function() require("flash").remote() end,            desc = "Remote Flash" },
		{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Remote Flash Treesitter" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	},
}
