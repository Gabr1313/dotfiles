require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    current_line_blame = false
})

vim.cmd [[highlight! GitSignsAdd guibg=NONE]]
vim.cmd [[highlight! GitSignsChange guibg=NONE]]
vim.cmd [[highlight! GitSignsDelete guibg=NONE]]
vim.keymap.set('n', '<leader>ob', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[O]ption [C]ontext toggle' })

require("gitlinker").setup({
    opts = {
        callbacks = {
            ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
        },
        add_current_line_on_normal_mode = true,
        action_callback = require("gitlinker.actions").open_in_browser,
        print_url = false,
        mappings = "<leader>gy",
    },
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[G]it [S]tatus' })

local gabri_Fugitive = vim.api.nvim_create_augroup("gabri_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = gabri_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, opts, { desc = '[G]it [P]ush' })

        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, opts, { desc = '[G]it [P]ull' })
    end,
})
