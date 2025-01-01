---@diagnostic disable: missing-fields
vim.keymap.set("n", "<leader>gr", "<cmd>wall<CR><cmd>!go run %<CR>", { desc = '[G]o [R]un' })
vim.keymap.set("n", "<leader>gb", "<cmd>wall<CR><cmd>!go build %<CR>", { desc = '[G]o [B]uild' })
vim.keymap.set("n", "<leader>ge", "<cmd>!./%:r<CR>", { desc = '[G]o [E]exe' })
vim.keymap.set("n", "<leader>gt", "<cmd>wall<CR><cmd>!go test<CR>", { desc = '[G]o [T]est' })
vim.keymap.set("n", "<leader>GT", "<cmd>wall<CR><cmd>!go test ./...<CR>", { desc = '[G]o [T]est Subdir' })
