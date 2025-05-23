-- TODO: TOOOOOOOOOOO SLOW. It is unusable with a 2k lines file in Odin (even with highlights disabled)
-- maybe the odin one is poorly written
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- "nvim-treesitter/playground",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c", "cpp", "python", "bash", "lua", "vim", "vimdoc", "go",
					"rust", "markdown", "markdown_inline"
				},
				ignore_install = { "tex", "latex" },
				sync_install = true,
				auto_install = true,
				highlight = {
					enable = true,
					-- disable = { "tex", "latex" },
					disable = function(lang, buf)
						if lang == "tex" or lang == "latex" then
							return true
						end
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
						return false
					end,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
				},
			})
            vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
                pattern = {"*.vert", "*.frag", "*.geom", "*.comp"},
                callback = function()
                    vim.bo.filetype = "glsl"
                end,
            })
		end,
	},
	--[[ {
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				multiline_threshold = 6,
				-- trim_scope = 'outer',
			})
		end
	} ]]
}
