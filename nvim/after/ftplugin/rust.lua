---@diagnostic disable: missing-fields
vim.keymap.set("n", "<leader>re", "<cmd>wall<CR><cmd>!rust-io %<CR>", { desc = '[R]un [E]xe' })
vim.keymap.set("n", "<leader>ro", "<cmd>wall<CR><cmd>!rust-io -o %<CR>", { desc = '[R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", "<cmd>wall<CR><cmd>!rust-io -r %<CR>", { desc = '[R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", "<cmd>wall<CR><cmd>!rust-io -ro %<CR>", { desc = '[R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", "<cmd>wall<CR><cmd>!rust-io -rp %<CR>", { desc = '[R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", "<cmd>wall<CR><cmd>!rust-io -rop %<CR>", { desc = '[R]un [P]arallel output' })

vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!cargo run<CR>", { desc = '[C]argo [R]un' })
vim.keymap.set("n", "<leader>cR", "<cmd>w<CR>:!RUST_BACKTRACE=1 cargo run<CR>", { desc = '[C]argo Run Backtrace' })
vim.keymap.set("n", "<leader>CR", "<cmd>w<CR><cmd>!cargo run --release<CR>", { desc = 'Release [C]argo [R]un' })
vim.keymap.set("n", "<leader>cb", "<cmd>w<CR><cmd>!cargo build<CR>", { desc = '[C]argo [B]uild' })
vim.keymap.set("n", "<leader>CB", "<cmd>w<CR><cmd>!cargo build --release<CR>", { desc = 'Release [C]argo [B]uild' })

vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!cargo check<CR>", { desc = '[C]argo [C]heck' })
vim.keymap.set("n", "<leader>ct", "<cmd>w<CR><cmd>!cargo test<CR>", { desc = '[C]argo [T]est' })
vim.keymap.set("n", "<leader>cf", "<cmd>w<CR><cmd>!cargo fix --allow-dirty<CR><CR>", { desc = '[C]argo [F]ix' })
