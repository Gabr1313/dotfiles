vim.keymap.set("n", "<leader>ra",
	"<cmd>wall<CR><cmd>!gcc -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", "<cmd>wall<CR><cmd>!gcc -Ofast %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly release' })
