vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc='Tmux [F]ind'})

-- vim.keymap.set("n", "<leader>E", "<cmd>Ex<CR>", { desc = '[E]x' })
vim.keymap.set("n", "<leader>oo", "<cmd>e ~/.config/nvim<CR><CR>", { desc = 'Nvim config folder' })
vim.keymap.set("n", "<leader>cD", "<cmd>cd %:p:h<CR>", { desc = 'Change nvim directory' })
vim.keymap.set("n", "<leader><leader>", "<cmd>w<CR><cmd>source %<CR>", { silent = true, desc = 'Source current file' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move line down' })

vim.keymap.set("n", "J", "mzJ`z", { desc = '[J]oin line' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = '1/2 page [D]own' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = '1/2 page [U]p' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'n' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'N' })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = '[P]ut no yank' })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = '[Y]ank to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[Y]ank to clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = '[D]elete no yank' })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Esc' })
vim.keymap.set("i", "<C-backspace>", "<Esc>vbda", { desc = 'Delete word' })
vim.keymap.set("n", "<C-backspace>", "<Esc>vbd", { desc = 'Delete word' })

vim.keymap.set("n", "<C-j>", "<C-W><C-j>", { desc = 'Window down' })
vim.keymap.set("n", "<C-h>", "<C-W><C-h>", { desc = 'Window right' })
vim.keymap.set("n", "<C-k>", "<C-W><C-k>", { desc = 'Window up' })
vim.keymap.set("n", "<C-l>", "<C-W><C-l>", { desc = 'Window left' })
vim.keymap.set("n", "<C-p>", "<cmd>bp<CR>", { desc = '[B]uffer [P]revious' })
vim.keymap.set("n", "<C-n>", "<cmd>bn<CR>", { desc = '[B]uffer [N]ext' })
vim.keymap.set("n", "<C-x>", "<cmd>bd<CR>", { desc = '[B]uffer Delete' })
vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz", { desc = 'Quick Fix List Previous' })
vim.keymap.set("n", "<C-.>", "<cmd>cnext<CR>zz", { desc = 'Quick Fix List Next' })
-- see `:h location`
-- vim.keymap.set("n", "<C-m>", "<cmd>lprev<CR>zz", {desc='Curren Window Previous'})
-- vim.keymap.set("n", "<C-/>", "<cmd>lnext<CR>zz", {desc='Curren Window Next'})
vim.keymap.set("n", "<C-]>", "<C-]>zz", { desc = 'Goto Definition' })
vim.keymap.set("n", "<C-[>", "<C-T>zz", { desc = 'Back form Defition' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = '[S]ubsitute word modify' })
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = '[S]ubsitute word empty' })
-- TODO: write a function so the following 2 commands work even with `\` and `/`
vim.keymap.set("v", "<leader>s", [["sy:%s/\v<C-r>s/<C-r>s/gI<Left><Left><Left>]], { desc = '[S]ubsitute words modify' })
vim.keymap.set("v", "<leader>S", [["sy:%s/\v<C-r>s//gI<Left><Left><Left>]], { desc = '[S]ubsitute words empty' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = 'E[x]ecutable' })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { desc = 'E[x]ecutable' })

vim.keymap.set("o", "<leader>a", ":<C-u>normal! mzggVG<CR>`z", { desc = '[A]ll buffer' })
vim.keymap.set("x", "<leader>a", ":<C-u>normal! ggVG<CR>", { desc = '[A]ll buffer' })
vim.keymap.set("n", "<leader>a", "v:<C-u>normal! ggVG<CR>", { desc = '[A]ll buffer' })

vim.keymap.set("x", "<", "<gv", { desc = 'Indent left' })
vim.keymap.set("x", ">", ">gv", { desc = 'Indent right' })

vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>", { desc = 'Vertical split' })
vim.keymap.set("n", "|", "<cmd>split<CR>", { desc = 'Horizontal split' })

vim.keymap.set("n", "<leader>w", "<cmd>wall<CR>", { desc = '[W]rite all' })
vim.keymap.set("n", "<leader>q", "<cmd>qall<CR>", { desc = '[Q]uit all' })

vim.keymap.set('n', '<C-right>', '<C-w>>', { desc = 'Bigger Horizontal split' })
vim.keymap.set('n', '<C-left>', '<C-w><', { desc = 'Smaller Horizontal split' })
vim.keymap.set('n', '<C-up>', '<C-w>+', { desc = 'Bigger Vertical split' })
vim.keymap.set('n', '<C-down>', '<C-w>-', { desc = 'Smaller Vertical split' })

vim.keymap.set('n', '<leader>zm', '<cmd>set foldmethod=marker<CR>', { desc = '[Z]fold [M]arker' })
