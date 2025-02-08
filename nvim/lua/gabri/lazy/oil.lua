return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            view_options = { show_hidden = true, }
        })
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = 'Oil' })
        vim.keymap.set("n", "_", require("oil").toggle_float, { desc = 'Oil' })
    end
}
