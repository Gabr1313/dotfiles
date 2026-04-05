vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            client.stop()
            -- vim.keymap.set("n", "gd", "<C-]>",  { desc = "[G]oto [D]efinition" })
            -- vim.keymap.set("n", "GD", "g]",  { desc = "[G]oto [D]efinition Select" })
            
            -- ^] jump to tag
            -- ^t jump back (:tags to show them)
            -- g] list (and select) matching tags
            -- ^w + } open  preview window
            -- ^wz    close preview window
            -- :tn :tp navigate matching tags
        end
    end,
})

-- ---@diagnostic disable: missing-fields
-- vim.keymap.set("n", "<leader>ra",
-- 	"<cmd>wall<CR><cmd>!gcc -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %<CR><cmd>!./a.out<CR>",
-- 	{ desc = '[R]un [A]t fly' })
-- vim.keymap.set("n", "<leader>RA", "<cmd>wall<CR><cmd>!gcc -Ofast %<CR><cmd>!./a.out<CR>",
-- 	{ desc = '[R]un [A]t fly release' })
-- -- vim.keymap.set("n", "<leader>rc", [[<cmd>%s/^\(\s*\)assert/\1\/\/ assert<CR>]],
-- -- 	{ desc = '[C]omment assert' })
-- -- vim.keymap.set("n", "<leader>rC", [[<cmd>%s/^\(\s*\)\/\/ assert/\1assert<CR>]],
-- -- 	{ desc = 'un[C]omment assert' })
-- vim.keymap.set("n", "<leader>cc", "<cmd>e %:r.c<CR>", { desc = '[C] open .[c]' })
-- vim.keymap.set("n", "<leader>ch", "<cmd>e %:r.h<CR>", { desc = '[C] open .[h]' })
