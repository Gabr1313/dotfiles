return {
	'RRethy/vim-illuminate',
	config = function()
		-- see lazy/colors.lua
		require('illuminate').configure({ delay = 0, })
		vim.keymap.set({ "n", "v" }, "]r", require('illuminate').goto_next_reference, { desc = "Next [r]eference" })
		vim.keymap.set({ "n", "v" }, "[r", require('illuminate').goto_prev_reference, { desc = "Previous [r]eference" })
	end
}
