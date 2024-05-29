return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            columns = { "icon" },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = false,
                -- ["<C-h>"] = "actions.select_split",
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
            view_options = {
                show_hidden = true,
            }
        })
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = 'Oil' })
        -- vim.keymap.set("n", "_", require("oil").toggle_float, { desc = 'Oil' })
    end
}
