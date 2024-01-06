local function exe()
	vim.cmd("wall")
	vim.cmd("!cpp-io %")
end

local function warning()
	vim.cmd("wall")
	vim.cmd("!cpp-io -w %")
end

local function output()
	vim.cmd("wall")
	vim.cmd("!cpp-io -o %")
end

local function release()
	vim.cmd("wall")
	vim.cmd("!cpp-io -r %")
end

local function output_release()
	vim.cmd("wall")
	vim.cmd("!cpp-io -ro %")
end

local function parallel()
	vim.cmd("wall")
	vim.cmd("!cpp-io -rp %")
end

local function output_parallel()
	vim.cmd("wall")
	vim.cmd("!cpp-io -rop %")
end

local function at_fly()
	vim.cmd("wall")
	vim.cmd("!g++ -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %")
	vim.cmd("!./a.out")
end

local function at_fly_release()
	vim.cmd("wall")
	vim.cmd("!g++ -Ofast %")
	vim.cmd("!./a.out")
end

vim.keymap.set("n", "<leader>re", exe, { desc = '[R]un [E]xe' })
vim.keymap.set("n", "<leader>rw", warning, { desc = '[R]un [W]arning' })
vim.keymap.set("n", "<leader>ro", output, { desc = '[R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", release, { desc = '[R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", output_release, { desc = '[R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", parallel, { desc = '[R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", output_parallel, { desc = '[R]un [P]arallel output' })

vim.keymap.set("n", "<leader>ra", at_fly, { desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", at_fly_release, { desc = '[R]un [A]t fly release' })
