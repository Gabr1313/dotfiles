vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc='Tmux [F]ind'})

vim.keymap.set("n", "<leader>E", "<cmd>Ex<CR>", { desc = '[E]x' })
vim.keymap.set("n", "<leader>o", "<cmd>e ~/.config/nvim<CR><CR>", { desc = '[E]x' })
vim.keymap.set("n", "<leader><leader>", "<cmd>w<CR><cmd>source %<CR>", { silent = true, desc = '[E]x' })

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

vim.keymap.set("n", "<C-j>", "<C-W><C-j>", { desc = 'Window down' })
vim.keymap.set("n", "<C-h>", "<C-W><C-h>", { desc = 'Window right' })
vim.keymap.set("n", "<C-k>", "<C-W><C-k>", { desc = 'Window up' })
vim.keymap.set("n", "<C-l>", "<C-W><C-l>", { desc = 'Window left' })
vim.keymap.set("n", "<C-p>", "<cmd>bp<CR>", { desc = '[B]uffer [P]revious' })
vim.keymap.set("n", "<C-n>", "<cmd>bn<CR>", { desc = '[B]uffer [N]ext' })
vim.keymap.set("n", "<C-x>", "<cmd>bd<CR>", { desc = '[B]uffer [D]elete' })
vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz", { desc = 'Quick Fix List Previous' })
vim.keymap.set("n", "<C-.>", "<cmd>cnext<CR>zz", { desc = 'Quick Fix List Next' })
-- see `:h location`
-- vim.keymap.set("n", "<C-m>", "<cmd>lprev<CR>zz", {desc='Curren Window Previous'})
-- vim.keymap.set("n", "<C-/>", "<cmd>lnext<CR>zz", {desc='Curren Window Next'})
vim.keymap.set("n", "<C-]>", "<C-]>zz", { desc = 'Goto Definition' })
vim.keymap.set("n", "<C-[>", "<C-T>zz", { desc = 'Back form Defition' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]ubsitute word' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = 'E[x]ecutable' })

vim.keymap.set("o", "<leader>a", ":<C-u>normal! mzggVG<CR>`z", { desc = '[A]ll buffer' }) -- dA = delete buffer ALL, yA = copy whole buffer ALL
vim.keymap.set("x", "<leader>a", ":<C-u>normal! ggVG<CR>", { desc = '[A]ll buffer' })
vim.keymap.set("n", "<leader>a", "v:<C-u>normal! ggVG<CR>", { desc = '[A]ll buffer' })

vim.keymap.set("x", "<", "<gv", { desc = 'Indent left' })
vim.keymap.set("x", ">", ">gv", { desc = 'Indent right' })

vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>", { desc = 'Vertical split' }) -- Copying the vscode behaviour of making tab splits
vim.keymap.set("n", "|", "<cmd>split<CR>", { desc = 'Horizontal split' })

vim.keymap.set("n", "<leader>w", "<cmd>wall<CR>", { desc = '[W]rite all' })
vim.keymap.set("n", "<leader>q", "<cmd>qall<CR>", { desc = '[Q]uit all' })

vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!gcc -std=c89 -pedantic -Wall -Wextra -O0 -g -fsanitize=address %<CR>"
  , { desc = '[C]89 [C]ompile' })
vim.keymap.set("n", "<leader>cl", "<cmd>w<CR><cmd>!gcc -std=c89 -pedantic -Wall -Wextra -O0 -g -fsanitize=address % /home/gabri/gitMine/polimi/2022_2023/fi/my_library/ilist.o<CR>",
  { desc = '[C]89 [C]ompile [L]ink' })
vim.keymap.set("n", "<leader>cs", "<cmd>w<CR><cmd>!gcc -std=c17 -pedantic -Wall -Wextra -O0 -g -fsanitize=address % <CR>",
  { desc = '[C]17 [S]anitize Compile' })
vim.keymap.set("n", "<leader>co", "<cmd>w<CR>:!gcc -std=c17 -O3 %<CR>", { desc = '[C]17 [O]ptimized Compile' })

vim.keymap.set('n', '<right>', '<C-w>>', { desc = 'Bigger Horizontal split' })
vim.keymap.set('n', '<left>', '<C-w><', { desc = 'Smaller Horizontal split' })
vim.keymap.set('n', '<up>', '<C-w>+', { desc = 'Bigger Vertical split' })
vim.keymap.set('n', '<down>', '<C-w>-', { desc = 'Smaller Vertical split' })

vim.keymap.set('n', '<leader>zm', '<cmd>set foldmethod=marker<CR>', { desc = '[Z]fold [M]arker' })

vim.keymap.set('n', '<leader>cb',
  '<cmd>LspStop<CR><cmd>lua require("nvim-autopairs").disable()<CR><cmd>IndentBlanklineDisable<CR><cmd>lua require("cmp").setup { enabled = false }<CR>'
  , { desc = '[C]89 [B]olchini on' })
vim.keymap.set('n', '<leader>cB',
  '<cmd>LspStart<CR><cmd>lua require("nvim-autopairs").enable()<CR><cmd>IndentBlanklineEnable<CR><cmd>lua require("cmp").setup { enabled = true }<CR>'
  , { desc = '[C]89 [B]olchini off' })
