vim.keymap.set("n", "<leader>cs", "<cmd>w<CR><cmd>!gcc -std=c17 -Wall -Wextra -O0 -g -fsanitize=address % <CR>",
    { desc = '[C]17 [S]anitize Compile' })
vim.keymap.set("n", "<leader>cS", "<cmd>w<CR><cmd>!gcc -std=c17 -Wall -Wextra -O0 -g -fsanitize=address % && ./a.out<CR>",
    { desc = '[C]17 [S]anitize Compile' })
vim.keymap.set("n", "<leader>co", "<cmd>w<CR>:!gcc -std=c17 -O3 %<CR>", { desc = '[C]17 [O]ptimized Compile' })
vim.keymap.set("n", "<leader>cO", "<cmd>w<CR>:!gcc -std=c17 -O3 % && ./a.out<CR>", { desc = '[C]17 [O]ptimized Compile' })
