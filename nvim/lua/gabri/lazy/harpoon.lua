return {
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<BS>h", mark.add_file,{ desc = "Harpoon insert" })
            vim.keymap.set("n", "<BS>m", ui.toggle_quick_menu, { desc = "Harpoon menu" })
            vim.keymap.set("n", "<BS>j", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
            vim.keymap.set("n", "<BS>k", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
            vim.keymap.set("n", "<BS>l", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
            vim.keymap.set("n", "<BS>;", function() ui.nav_file(4) end, { desc = "Harpoon 5" })
        end
    },
}
