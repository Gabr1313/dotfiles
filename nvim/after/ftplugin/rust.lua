local function exe()
	vim.cmd("wall")
	vim.cmd("!rust-io %")
end

local function output()
	vim.cmd("wall")
	vim.cmd("!rust-io -o %")
end

local function release()
	vim.cmd("wall")
	vim.cmd("!rust-io -r %")
end

local function output_release()
	vim.cmd("wall")
	vim.cmd("!rust-io -ro %")
end

local function parallel()
	vim.cmd("wall")
	vim.cmd("!rust-io -rp %")
end

local function output_parallel()
	vim.cmd("wall")
	vim.cmd("!rust-io -rop %")
end

vim.keymap.set("n", "<leader>re", exe, { desc = '[R]un [E]xe' })
vim.keymap.set("n", "<leader>ro", output, { desc = '[R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", release, { desc = '[R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", output_release, { desc = '[R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", parallel, { desc = '[R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", output_parallel, { desc = '[R]un [P]arallel output' })

vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!cargo run<CR>", { desc = '[C]argo [R]un' })
vim.keymap.set("n", "<leader>cR", "<cmd>w<CR>:!RUST_BACKTRACE=1 cargo run<CR>", { desc = '[C]argo Run Backtrace' })
vim.keymap.set("n", "<leader>CR", "<cmd>w<CR><cmd>!cargo run --release<CR>", { desc = 'Release [C]argo [R]un' })
vim.keymap.set("n", "<leader>cb", "<cmd>w<CR><cmd>!cargo build<CR>", { desc = '[C]argo [B]uild' })
vim.keymap.set("n", "<leader>CB", "<cmd>w<CR><cmd>!cargo build --release<CR>", { desc = 'Release [C]argo [B]uild' })

vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!cargo check<CR>", { desc = '[C]argo [C]heck' })
vim.keymap.set("n", "<leader>ct", "<cmd>w<CR><cmd>!cargo test<CR>", { desc = '[C]argo [T]est' })
vim.keymap.set("n", "<leader>cf", "<cmd>w<CR><cmd>!cargo fix --allow-dirty<CR><CR>", { desc = '[C]argo [F]ix' })
