vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "i"  }, "<F1>", "<Esc>", { silent = true })
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>", { silent = true })
vim.keymap.set("c", "<C-n>", "<C-f>", { desc = "Esc" })
vim.keymap.set({ "t" }, "<Esc>", "<c-\\><c-n>", { silent = true, desc = "[Esc] terminal" })

vim.keymap.set("n", "<C-/>", function()
    if vim.api.nvim_get_option('hlsearch') == true then
        vim.api.nvim_set_option('hlsearch', false)
    else
        vim.api.nvim_set_option('hlsearch', true)
    end
end, { desc = "Highlight toggle" })

vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<CR>", { silent = true, desc = "Change directory" })
vim.keymap.set("n", "<leader><leader>", [[<cmd>%s/\s\+$//e<CR>]], { desc = "Remove trailing spaces" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "1/2 page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "1/2 page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "n" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "N" })

vim.keymap.set("x", "<leader>d", [["_d]], { desc = "[D]elete no yank" }) -- in normal mode I use 'd' to debug
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]ut no yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to clipboard" })

vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix list [P]revious" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix list [N]ext" })
vim.keymap.set("n", "<C-S-p>", "<cmd>lprev<CR>zz", { desc = "Local quickfix list [P]revious" })
vim.keymap.set("n", "<C-S-n>", "<cmd>lnext<CR>zz", { desc = "Local quickfix list [V]ext" })

vim.keymap.set("n", "<C-Up>", "4<C-w>+", { desc = "Resize window vertically" })
vim.keymap.set("n", "<C-Down>", "4<C-w>-", { desc = "Change window smaller vertically" })
vim.keymap.set("n", "<C-Right>", "4<C-w>>", { desc = "Change window bigger horizontally" })
vim.keymap.set("n", "<C-Left>", "4<C-w><", { desc = "Change window smaller horizontally" })

vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubsitute [E]nd" })
vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "[S]ubsitute [B]eginning" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR><CR>", { desc = "E[x]ecutable" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR><CR>", { desc = "No E[x]ecutable" })

vim.keymap.set("x", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("n", "<leader>zm", "<cmd>set foldmethod=marker<CR>", { desc = "[Z]fold [M]arker" })

vim.keymap.set("n", "<leader>w", function()
    if vim.api.nvim_win_get_option(vim.api.nvim_get_current_win(), 'wrap') then
        vim.opt.wrap = false
        vim.keymap.del("n", "j")
        vim.keymap.del("n", "k")
        vim.keymap.del("n", "$")
        vim.keymap.del("n", "0")
        vim.keymap.del("n", "^")
        vim.keymap.del("n", "_")
    else
        vim.opt.wrap = true
        vim.keymap.set("n", "j", "gj", { desc = "[j] wrapping on" })
        vim.keymap.set("n", "k", "gk", { desc = "[k] wrapping on" })
        vim.keymap.set("n", "$", "g$", { desc = "[$] wrapping on" })
        vim.keymap.set("n", "0", "g0", { desc = "[0] wrapping on" })
        vim.keymap.set("n", "^", "g^", { desc = "[^] wrapping on" })
        vim.keymap.set("n", "_", "g_", { desc = "[_] wrapping on" })
    end
end, { desc = "[W]rap toggle" })

vim.keymap.set("i", "<C-space>{", "{}<Left>", { desc = "Autopair {}" })
vim.keymap.set("i", "<C-space>[", "[]<Left>", { desc = "Autopair []" })
vim.keymap.set("i", "<C-space>(", "()<Left>", { desc = "Autopair ()" })
vim.keymap.set("i", "<C-space>\"", "\"\"<Left>", { desc = "Autopair \"\"" })
vim.keymap.set("i", "<C-space>(", "''<Left>", { desc = "Autopair ''" })
