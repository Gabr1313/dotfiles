return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local keys = {
            {
                "<C-;>",
                function() require("harpoon"):list():add() end,
                desc = "Harpoon File",
            },
            {
                "<leader>h",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon Quick Menu",
            },
        }

        -- for i = 1, 9 do
        --     table.insert(keys, {
        --         "<C-" .. i .. ">",
        --         function() require("harpoon"):list():select(i) end,
        --         desc = "Harpoon to File " .. i,
        --     })
        -- end
        table.insert(keys, { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon to File " .. 1, })
        table.insert(keys, { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon to File " .. 2, })
        table.insert(keys, { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon to File " .. 3, })
        table.insert(keys, { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon to File " .. 4, })
        return keys
    end,
}
