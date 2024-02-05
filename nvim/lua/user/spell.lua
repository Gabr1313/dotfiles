vim.opt.spell = false
vim.keymap.set("n", "<leader>si", "<cmd>set spell<CR><cmd>set spelllang=en_us,it<CR>", { desc = "[S]pell [I]t & en_us" })
vim.keymap.set("n", "<leader>su", "<cmd>set spell<CR><cmd>set spelllang=en_us<CR>", { desc = "[S]pell en_[U]s" })
vim.keymap.set("n", "<leader>sn", "<cmd>set nospell<CR>", { desc = "[S]pell [N]o" })
vim.opt.spelllang = "en_gb"
vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })
vim.keymap.set("n", "<C-s>", "[s1z=", { desc = "[S]pell correct" })

local function replace_accented_letters()
    vim.cmd("%s/\\Ca'/à/ge")
    vim.cmd("%s/\\Ce'/è/ge")
    vim.cmd("%s/\\Ci'/ì/ge")
    vim.cmd("%s/\\Co'/ò/ge")
    vim.cmd("%s/\\Cu'/ù/ge")
    vim.cmd("%s/\\CA'/À/ge")
    vim.cmd("%s/\\CE'/È/ge")
    vim.cmd("%s/\\CI'/Ì/ge")
    vim.cmd("%s/\\CO'/Ò/ge")
    vim.cmd("%s/\\CU'/Ù/ge")
end

vim.keymap.set("n", "<leader>sa", replace_accented_letters, { desc = "[S]pell replace [A]ccented letters" })
