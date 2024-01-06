local function at_fly()
	vim.cmd("wall")
	vim.cmd("!gcc -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %")
	vim.cmd("!./a.out")
end

local function at_fly_release()
	vim.cmd("wall")
	vim.cmd("!gcc -Ofast %")
	vim.cmd("!./a.out")
end

vim.keymap.set("n", "<leader>ra", at_fly, { desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", at_fly_release, { desc = '[R]un [A]t fly release' })
