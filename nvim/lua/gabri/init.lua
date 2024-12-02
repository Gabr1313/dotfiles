require("gabri.set")
require("gabri.remap")
require("gabri.spell")
require("gabri.lazy_init")

local augroup = vim.api.nvim_create_augroup
local lsp_group = augroup('LspGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('LspAttach', {
    group = lsp_group,
    callback = function(_, bufnr)
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[G]oto [D]eclaration' })
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = bufnr, desc = '[G]oto [T]ype definition' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = '[G]oto [I]mplementation' })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = '[V]iew [D]iagnostic' })
        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature help' })

        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, desc = '[R]efe[r]ences' })
        vim.keymap.set({ "v", "n" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = '[C]ode [A]ction' })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Previous [D]iagnostic' })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Next [D]iagnostic' })

        vim.keymap.set('n', 'fr', require('telescope.builtin').lsp_references,
            { buffer = bufnr, desc = '[F]zf [R]eferences' })
        vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]zf [D]iagnostics' })
        vim.keymap.set('n', '<leader>fsd', require('telescope.builtin').lsp_document_symbols,
            { buffer = bufnr, desc = '[F]zf [S]ymbols [D]ocument' })
        vim.keymap.set('n', '<leader>fsw', require('telescope.builtin').lsp_dynamic_workspace_symbols,
            { buffer = bufnr, desc = '[F]zf [S]ymbol [W]orkspace' })

        local function toggle_diagnostics()
            if vim.diagnostic.is_disabled() then
                vim.diagnostic.enable()
            else
                vim.diagnostic.disable()
            end
        end

        vim.diagnostic.disable()
        vim.keymap.set("n", "<leader>ld", toggle_diagnostics, { desc = '[L]sp toggle [D]iagnostic' })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = '[L]sp [R]estart' })
    end
})

-- local notify = vim.notify
-- vim.notify = function(msg, ...)
-- 	if msg:match("warning: multiple different client offset_encodings") then
-- 		return
-- 	end
--
-- 	notify(msg, ...)
-- end
