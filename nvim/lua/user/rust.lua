vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!cargo run<CR>"
, { desc = '[C]argo [R]un' })
vim.keymap.set("n", "<leader>cR", "<cmd>w<CR>:!RUST_BACKTRACE=1 cargo run<CR>"
, { desc = '[C]argo Run Backtrace' })
vim.keymap.set("n", "<leader>cp", "<cmd>w<CR>:!cargo run -- "
, { desc = '[C]argo run [p]arameters' })
vim.keymap.set("n", "<leader>cb", "<cmd>w<CR><cmd>!cargo build<CR>"
, { desc = '[C]argo [B]uild' })
vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!cargo check<CR>"
, { desc = '[C]argo [C]heck' })
vim.keymap.set("n", "<leader>ct", "<cmd>w<CR><cmd>!cargo test<CR>"
, { desc = '[C]argo [T]est' })
vim.keymap.set("n", "<leader>cf", "<cmd>w<CR><cmd>!cargo fix --allow-dirty<CR><CR>"
, { desc = '[C]argo [F]ix' })
vim.keymap.set("n", "<leader>cd", "<cmd>w<CR><cmd>!cargo doc --open<CR>"
, { desc = '[C]argo [D]ocumentation' })

vim.keymap.set("n", "<leader>CR", "<cmd>w<CR><cmd>!cargo run --release<CR>"
, { desc = 'Release [C]argo [R]un' })
vim.keymap.set("n", "<leader>CP", "<cmd>w<CR>:!cargo run --release -- "
, { desc = 'Release [C]argo run [P]arameters' })
vim.keymap.set("n", "<leader>CB", "<cmd>w<CR><cmd>!cargo build --release<CR>"
, { desc = 'Release [C]argo [B]uild' })

vim.keymap.set("n", "<leader>ce", "<cmd>w<CR>:!./auto_test %<CR>"
, { desc = '[C]argo [E]xe bin' })
vim.keymap.set("n", "<leader>cE", "<cmd>w<CR>:!RUST_BACKTRACE=1 ./auto_test %<CR>"
, { desc = '[C]argo [E]xe Backtrace' })
vim.keymap.set("n", "<leader>CE", "<cmd>w<CR>:!./auto_test % -release<CR>"
, { desc = 'Release [C]argo [Exe] bin' })
vim.keymap.set("n", "<leader>co", "<cmd>w<CR>:!./auto_test % -output-file<CR>"
, { desc = '[C]argo [E]xe bin' })
vim.keymap.set("n", "<leader>CO", "<cmd>w<CR>:!./auto_test % -release -output-file<CR>"
, { desc = 'Release [C]argo [Exe] bin' })
