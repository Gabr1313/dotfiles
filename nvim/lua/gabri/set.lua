vim.o.mouse = 'a'
vim.opt.guicursor = "a:blinkwait200-blinkon200-blinkoff200,n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.cindent = true -- vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "81"

vim.opt.textwidth = 100
vim.opt.history = 256
vim.opt.list = true
vim.opt.listchars = "tab:→ ,eol:↵" -- nbsp:∙

vim.opt.synmaxcol = 256
vim.opt.cursorline = true

vim.opt.completeopt = 'menu,menuone,preview'
