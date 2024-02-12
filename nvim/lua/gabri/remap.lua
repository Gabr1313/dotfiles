vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>", { silent = true })
vim.keymap.set("c", "<C-n>", "<C-f>", { desc = "Esc" })

vim.keymap.set("n", "<leader>/", "/\\c", { desc = "[/] ignore case" })
vim.keymap.set("n", "<leader>?", "?\\c", { desc = "[?] ignore case" })
vim.keymap.set("n", "<BS>/", function()
        if vim.api.nvim_get_option('hlsearch') == true then
            vim.api.nvim_set_option('hlsearch', false)
        else
            vim.api.nvim_set_option('hlsearch', true)
        end
    end, { desc = "No Highlight" })

vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<CR>", { silent = true, desc = "Change directory" })

vim.keymap.set("n", "<C-j>", ":m +1<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<C-k>", ":m -2<CR>", { desc = "Move line down" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "1/2 page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "1/2 page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "n" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "N" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete no yank" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]ut no yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to clipboard" })

vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix list [P]revious" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix list [N]ext" })
vim.keymap.set("n", "<C-S-p>", "<cmd>lprev<CR>zz", { desc = "Local quickfix list [P]revious" })
vim.keymap.set("n", "<C-S-n>", "<cmd>lnext<CR>zz", { desc = "Local quickfix list [V]ext" })

vim.keymap.set("n", "<C-Up>", "2<C-w>+", { desc = "Change window bigger vertically" })
vim.keymap.set("n", "<C-Down>", "2<C-w>-", { desc = "Change window smaller vertically" })
vim.keymap.set("n", "<C-Right>", "2<C-w>>", { desc = "Change window bigger horizontally" })
vim.keymap.set("n", "<C-Left>", "2<C-w><", { desc = "Change window smaller horizontally" })

-- vim.keymap.set("n", "<C-]>", "<C-]>zz", { desc = "Goto Definition" })
-- vim.keymap.set("n", "<C-t>", "<C-t>zz", { desc = "Back form Defition" })

vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubsitute [E]nd" })
vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "[S]ubsitute [B]eginning" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR><CR>", { desc = "E[x]ecutable" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR><CR>", { desc = "No E[x]ecutable" })

vim.keymap.set("x", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("n", "<leader>zm", "<cmd>set foldmethod=marker<CR>", { desc = "[Z]fold [M]arker" })

vim.keymap.set("n", "<leader>w", function()
        vim.opt.wrap = true
        vim.keymap.set("n", "j", "gj", { desc = "[j] wrapping on" })
        vim.keymap.set("n", "k", "gk", { desc = "[k] wrapping on" })
        vim.keymap.set("n", "$", "g$", { desc = "[$] wrapping on" })
        vim.keymap.set("n", "0", "g0", { desc = "[0] wrapping on" })
        vim.keymap.set("n", "^", "g^", { desc = "[^] wrapping on" })
        vim.keymap.set("n", "_", "g_", { desc = "[_] wrapping on" })
    end , { desc = "[W]rap on (+keymaps)" })

vim.keymap.set("n", "<leader>W", function()
        vim.opt.wrap = false
        vim.keymap.del("n", "j")
        vim.keymap.del("n", "k")
        vim.keymap.del("n", "$")
        vim.keymap.del("n", "0")
        vim.keymap.del("n", "^")
        vim.keymap.del("n", "_")
    end , { desc = "[W]rap off (+keymaps)" })
