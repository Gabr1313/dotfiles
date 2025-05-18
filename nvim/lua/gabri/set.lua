vim.o.mouse = 'a'
-- vim.opt.guicursor = "a:blinkwait200-blinkon200-blinkoff200,n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.guicursor = "a:blinkon0,n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.showmode = false
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true -- vim.opt.cindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.hlsearch = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
-- vim.opt.textwidth = 80

vim.opt.history = 256
vim.opt.list = true
-- vim.opt.listchars = "tab:→ ,eol:↵" -- nbsp:∙
vim.opt.listchars = "tab: ,eol:󰌑" -- nbsp:∙

vim.opt.synmaxcol = 256
vim.opt.cursorline = false

vim.opt.completeopt = 'menu,menuone,preview'

vim.o.exrc = true
