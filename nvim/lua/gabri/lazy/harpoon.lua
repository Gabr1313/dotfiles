return {
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<C-h>", mark.add_file,{ desc = "Harpoon add" })
            vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu, { desc = "Harpoon menu" })
            vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
            vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
            vim.keymap.set("n", "<C-,>", function() ui.nav_file(4) end, { desc = "Harpoon 4" })
            vim.keymap.set("n", "<C-.>", function() ui.nav_file(5) end, { desc = "Harpoon 4" })
        end
    },
}
