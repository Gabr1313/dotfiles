vim.keymap.set("n", "<leader>re", "<cmd>w<CR><cmd>!cpp-io %<CR>", { desc = '[C]++ [E]xe' })
vim.keymap.set("n", "<leader>rw", "<cmd>w<CR><cmd>!cpp-io -w %<CR>", { desc = '[C]++ [W]arning exe' })
vim.keymap.set("n", "<leader>ro", "<cmd>w<CR><cmd>!cpp-io -o %<CR>", { desc = '[C]++ [O]ouput' })

vim.keymap.set("n", "<leader>RE", "<cmd>w<CR><cmd>!cpp-io -r %<CR>", { desc = '[C]++ [E]xe release' })
vim.keymap.set("n", "<leader>RO", "<cmd>w<CR><cmd>!cpp-io -ro %<CR>", { desc = '[C]++ [O]ouput release' })

vim.keymap.set("n", "<leader>rp", "<cmd>w<CR><cmd>!cpp-io -rp %<CR>", { desc = '[C]++ [P]arallel' })
vim.keymap.set("n", "<leader>RP", "<cmd>w<CR><cmd>!cpp-io -rop %<CR>", { desc = '[C]++ [P]arallel output' })
