vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Esc" })

vim.keymap.set("n", "<leader>oo", "<cmd>e ~/.config/nvim<CR><CR>", { desc = "Nvim config folder" })

vim.keymap.set("n", "<C-s>", "<cmd>!tmux-sessionizer<CR><CR>", { silent = true, desc = "Tmux-sessionizer" })

vim.keymap.set("v", "<C-j>", ':m +1<CR>gv=gv', { desc = "Move line up" })
vim.keymap.set("v", "<C-k>", ':m -2<CR>gv=gv', { desc = "Move line down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "1/2 page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "1/2 page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "n" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "N" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]ut no yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete no yank" })

vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix list [P]revious" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix list [N]ext" })
vim.keymap.set("n", "<C-S-p>", "<cmd>lprev<CR>zz", { desc = "Local quickfix list [P]revious" })
vim.keymap.set("n", "<C-S-n>", "<cmd>lnext<CR>zz", { desc = "Local quickfix list [V]ext" })

vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Change window bigger vertically" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Change window smaller vertically" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Change window bigger horizontally" })
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Change window smaller horizontally" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

vim.keymap.set("n", "<C-]>", "<C-]>zz", { desc = "Goto Definition" })
vim.keymap.set("n", "<C-t>", "<C-t>zz", { desc = "Back form Defition" })

vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubsitute [E]nd" })
vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "[S]ubsitute [B]eginning" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR><CR>", { desc = "E[x]ecutable" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR><CR>", { desc = "No E[x]ecutable" })

vim.keymap.set("x", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("n", "<leader>zm", "<cmd>set foldmethod=marker<CR>", { desc = "[Z]fold [M]arker" })

vim.keymap.set("n", "<leader><leader>", [[<cmd>%s/\s\+$//e<CR>]], { desc = "Remove trailing spaces" })

vim.keymap.set("n", "<leader>zz",
    "<C-w>o<cmd>execute 'topleft' ((&columns - 106) / 2 - 6) . 'vsplit _padding_' | wincmd p<CR>zz",
    { desc = "Center horizontally" })
vim.keymap.set("n", "<leader>zc", "<cmd>bd _padding_<CR>", { desc = "[C]lose center horizontally" })
