local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'clangd',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-l>"] = cmp.mapping.complete(),
    ['<C-Backspace>'] = cmp.mapping.abort(),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif luasnip.expandable() then
            luasnip.expand()
        else
            fallback()
        end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s", }),
})

cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '󱠃',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = '[C]ode [A]ction' })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type [D]efinition' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
        { buffer = bufnr, desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = '[G]oto [I]mplementation' })
    -- See `:help K` for why this keymap
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = '[V]iew [D]iagnostic' })
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, desc = '[R]efe[r]ences' })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Next [D]iagnostic' })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'Previous [D]iagnostic' })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Help' })
    vim.keymap.set("n", "<leader><h>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Help' })
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
        { buffer = bufnr, desc = 'Find [D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_dynamic_workspace_symbols,
        { buffer = bufnr, desc = '[F]ind Workspace [S]ymbol' })

    -- Lesser used LSP functionality
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[G]oto [D]eclaration' })
    -- vim.keymap.set('<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = '[W]orkspace [A]dd Folder' })
    -- vim.keymap.set('<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = '[W]orkspace [R]emove Folder' })
    -- vim.keymap.set('<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, { buffer = bufnr, desc = '[W]orkspace [L]ist Folders' })
end)

-- deletes an annoying message when pressing <leader>K
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = '[L]sp [F]ormat' })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = '[L]sp [R]estart' })
