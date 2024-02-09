return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = false,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["+"] = "actions.open_cwd",
                ["="] = "actions.cd",
                ["_"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
            },
        })
        vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = '[E]x Tree' })
        vim.keymap.set("n", "<leader>E", "<cmd>cd %:h<CR><cmd>Oil<CR>", { desc = 'cd [E]x Tree' })
        vim.keymap.set("n", "<leader>oo", "<cmd>cd ~/.config/nvim/lua/gabri<CR><cmd>Oil<CR>",
            { desc = '[O]pen [O]ption' })
    end
}
