vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!cargo run<CR>"
, { desc = '[C]argo [R]un' })
vim.keymap.set("n", "<leader>cR", "<cmd>w<CR>:!RUST_BACKTRACE=1 cargo run<CR>"
, { desc = '[C]argo Run Backtrace' })
vim.keymap.set("n", "<leader>CR", "<cmd>w<CR><cmd>!cargo run --release<CR>"
, { desc = 'Release [C]argo [R]un' })

vim.keymap.set("n", "<leader>cp", "<cmd>w<CR>:!cargo run -- "
, { desc = '[C]argo run [p]arameters' })
vim.keymap.set("n", "<leader>CP", "<cmd>w<CR>:!cargo run --release -- "
, { desc = 'Release [C]argo run [P]arameters' })

vim.keymap.set("n", "<leader>cb", "<cmd>w<CR><cmd>!cargo build<CR>"
, { desc = '[C]argo [B]uild' })
vim.keymap.set("n", "<leader>CB", "<cmd>w<CR><cmd>!cargo build --release<CR>"
, { desc = 'Release [C]argo [B]uild' })

vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!cargo check<CR>"
, { desc = '[C]argo [C]heck' })
vim.keymap.set("n", "<leader>ct", "<cmd>w<CR><cmd>!cargo test<CR>"
, { desc = '[C]argo [T]est' })
vim.keymap.set("n", "<leader>cf", "<cmd>w<CR><cmd>!cargo fix --allow-dirty<CR><CR>"
, { desc = '[C]argo [F]ix' })
vim.keymap.set("n", "<leader>cd", "<cmd>w<CR><cmd>!cargo doc --open<CR>"
, { desc = '[C]argo [D]ocumentation' })

vim.keymap.set("n", "<leader>re", "<cmd>w<CR><cmd>!rust-io %<CR>"
, { desc = '[R]ust [E]xe bin' })
vim.keymap.set("n", "<leader>rE", "<cmd>w<CR><cmd>!RUST_BACKTRACE=1 rust-io %<CR>"
, { desc = '[R]ust [E]xe Backtrace' })
vim.keymap.set("n", "<leader>RE", "<cmd>w<CR><cmd>!rust-io % -r<CR>"
, { desc = 'Release [R]ust [E]xe' })

vim.keymap.set("n", "<leader>ro", "<cmd>w<CR><cmd>!rust-io % -o<CR>"
, { desc = '[C]argo [R]ust' })
vim.keymap.set("n", "<leader>RO", "<cmd>w<CR><cmd>!rust-io % -ro<CR>"
, { desc = 'Release [R]ust [O]output' })

vim.keymap.set("n", "<leader>rp", "<cmd>w<CR><cmd>!rust-io % -rp<CR>"
, { desc = 'Release [R]ust [P]arallel' })
vim.keymap.set("n", "<leader>RP", "<cmd>w<CR><cmd>!rust-io % -rop<CR>"
, { desc = 'Release [R]ust Output [P]output' })
