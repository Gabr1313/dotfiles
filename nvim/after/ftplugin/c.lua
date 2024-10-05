vim.keymap.set("n", "<leader>ra",
	"<cmd>wall<CR><cmd>!gcc -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", "<cmd>wall<CR><cmd>!gcc -Ofast %<CR><cmd>!./a.out<CR>",
	{ desc = '[R]un [A]t fly release' })
-- vim.keymap.set("n", "<leader>rc", [[<cmd>%s/^\(\s*\)assert/\1\/\/ assert<CR>]],
-- 	{ desc = '[C]omment assert' })
-- vim.keymap.set("n", "<leader>rC", [[<cmd>%s/^\(\s*\)\/\/ assert/\1assert<CR>]],
-- 	{ desc = 'un[C]omment assert' })
vim.keymap.set("n", "<leader>cc", "<cmd>e %:r.c<CR>", { desc = '[C] open .[c]' })
vim.keymap.set("n", "<leader>ch", "<cmd>e %:r.h<CR>", { desc = '[C] open .[h]' })
