vim.opt.guicursor = ""
vim.o.mouse = 'a'
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
-- vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.history = 256
vim.opt.list = true
vim.opt.listchars:append "eol:↵,trail: "
vim.opt.synmaxcol = 256

-- vim.opt.spell = true
-- vim.opt.spelllang = "en_gb"
-- vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })
-- vim.keymap.set("n", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })
