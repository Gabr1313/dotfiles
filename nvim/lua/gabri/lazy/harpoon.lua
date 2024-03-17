return {
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "ma", mark.add_file,{ desc = "Harpoon add" })
            vim.keymap.set("n", "mt", ui.toggle_quick_menu, { desc = "Harpoon tab" })
            vim.keymap.set("n", "mw", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
            vim.keymap.set("n", "me", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
            vim.keymap.set("n", "mr", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
            vim.keymap.set("n", "ms", function() ui.nav_file(4) end, { desc = "Harpoon 4" })
            vim.keymap.set("n", "md", function() ui.nav_file(5) end, { desc = "Harpoon 5" })
            vim.keymap.set("n", "mf", function() ui.nav_file(6) end, { desc = "Harpoon 6" })
        end
    },
}
