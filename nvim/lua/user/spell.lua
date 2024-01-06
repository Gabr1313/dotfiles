vim.opt.spell = false
vim.keymap.set("n", "<leader>si", "<cmd>set spell<CR><cmd>set spelllang=en_us,it<CR>", { desc = "[S]pell [I]t & en_us" })
vim.keymap.set("n", "<leader>su", "<cmd>set spell<CR><cmd>set spelllang=en_us<CR>", { desc = "[S]pell en_[U]s" })
vim.keymap.set("n", "<leader>sn", "<cmd>set nospell<CR>", { desc = "[S]pell [N]o" })
vim.opt.spelllang = "en_gb"
vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })
vim.keymap.set("n", "<C-s>", "[s1z=", { desc = "[S]pell correct" })

local function replace_accented_letters()
    vim.cmd("%s/a'/à/ge")
    vim.cmd("%s/e'/è/ge")
    vim.cmd("%s/i'/ì/ge")
    vim.cmd("%s/o'/ò/ge")
    vim.cmd("%s/u'/ù/ge")
    vim.cmd("%s/A'/À/ge")
    vim.cmd("%s/E'/È/ge")
    vim.cmd("%s/I'/Ì/ge")
    vim.cmd("%s/O'/Ò/ge")
    vim.cmd("%s/U'/Ù/ge")
end

vim.keymap.set("n", "<leader>sa", replace_accented_letters, { desc = "[S]pell replace [A]ccented letters" })
