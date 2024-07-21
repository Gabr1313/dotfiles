return {
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<C-q>", mark.add_file,{ desc = "Harpoon add" })
            vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu, { desc = "Harpoon menu" })
            vim.keymap.set("n", "<C-6>", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
            vim.keymap.set("n", "<C-7>", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
            vim.keymap.set("n", "<C-8>", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
            vim.keymap.set("n", "<C-9>", function() ui.nav_file(4) end, { desc = "Harpoon 4" })
            vim.keymap.set("n", "<C-0>", function() ui.nav_file(5) end, { desc = "Harpoon 5" })
        end
    },
}
