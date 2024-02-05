vim.keymap.set("n", "<leader>re", "<cmd>wall<CR><cmd>!cpp-io %<CR>", { desc = '[R]un [E]xe' })
vim.keymap.set("n", "<leader>rw", "<cmd>wall<CR><cmd>!cpp-io -w %<CR>", { desc = '[R]un [W]arning' })
vim.keymap.set("n", "<leader>ro", "<cmd>wall<CR><cmd>!cpp-io -o %<CR>", { desc = '[R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", "<cmd>wall<CR><cmd>!cpp-io -r %<CR>", { desc = '[R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", "<cmd>wall<CR><cmd>!cpp-io -ro %<CR>", { desc = '[R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", "<cmd>wall<CR><cmd>!cpp-io -rp %<CR>", { desc = '[R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", "<cmd>wall<CR><cmd>!cpp-io -rop %<CR>", { desc = '[R]un [P]arallel output' })

vim.keymap.set("n", "<leader>ra",
	"<cmd>wall<CR><cmd>!g++ -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", "<cmd>wall<CR><cmd>!g++ -Ofast %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly release' })
