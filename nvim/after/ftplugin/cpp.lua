---@diagnostic disable: missing-fields
vim.keymap.set("n", "<leader>re", "<cmd>wa<CR><cmd>!cpp-io %<CR>",      { desc = 'cpp [R]un [E]xe' })
vim.keymap.set("n", "<leader>rw", "<cmd>wa<CR><cmd>!cpp-io -w %<CR>",   { desc = 'cpp [R]un [W]arning' })
vim.keymap.set("n", "<leader>ro", "<cmd>wa<CR><cmd>!cpp-io -o %<CR>",   { desc = 'cpp [R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", "<cmd>wa<CR><cmd>!cpp-io -r %<CR>",   { desc = 'cpp [R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", "<cmd>wa<CR><cmd>!cpp-io -ro %<CR>",  { desc = 'cpp [R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", "<cmd>wa<CR><cmd>!cpp-io -rp %<CR>",  { desc = 'cpp [R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", "<cmd>wa<CR><cmd>!cpp-io -rop %<CR>", { desc = 'cpp [R]un [P]arallel output' })
vim.keymap.set("n", "<leader>rf",
	"<cmd>wall<CR><cmd>!g++ -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %<CR><cmd>!./a.out<CR>",
	{ desc = 'cpp [R]un at [F]ly' })
vim.keymap.set("n", "<leader>RF", "<cmd>wall<CR><cmd>!g++ -Ofast %<CR><cmd>!./a.out<CR>",
	{ desc = 'cpp [R]un at [F]ly release' })

local dap = require("dap")
local function update_dap_config()
	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = "${workspaceFolder}" .. "/a.out",
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
			args = "<input/in.txt",
		},
	}
end

vim.keymap.set("n", "<leader>rd", function()
	dap.disconnect()
	vim.cmd("wa")
	vim.cmd("!g++ -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %")
	update_dap_config()
	dap.continue()
end, { desc = '[R]un [D]ebug' })
vim.keymap.set("n", "<leader>RD", function()
	dap.disconnect()
	vim.cmd("wa")
	vim.cmd("!g++ -Ofast -g %")
	update_dap_config()
	dap.continue()
end, { desc = '[R]un [D]ebug' })
