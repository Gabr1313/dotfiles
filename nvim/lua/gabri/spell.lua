vim.opt.spell = false
vim.keymap.set("n", "<leader>si", "<cmd>set spell<cr><cmd>set spelllang=en_us,it<cr>", { desc = "[s]pell [i]t & en_us" })
vim.keymap.set("n", "<leader>su", "<cmd>set spell<cr><cmd>set spelllang=en_us<cr>", { desc = "[s]pell en_[u]s" })
vim.keymap.set("n", "<leader>sn", "<cmd>set nospell<cr>", { desc = "[s]pell [n]o" })
vim.opt.spelllang = "en_gb"
vim.keymap.set("i", "<c-s>", "<esc>[s1z=`]a", { desc = "[s]pell correct" })
vim.keymap.set("n", "<c-s>", "[s1z=", { desc = "[s]pell correct" })

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

vim.keymap.set("n", "<leader>sa", replace_accented_letters, { desc = "[s]pell replace [a]ccented letters" })
