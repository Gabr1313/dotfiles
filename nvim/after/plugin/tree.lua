local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<LeftMouse>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<RightMouse>', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Preview'))
    vim.keymap.set('n', 'C', api.tree.collapse_all, opts('[C]ollapse'))
    vim.keymap.set('n', 'D', api.fs.remove, opts('[D]emove'))
    vim.keymap.set('n', 'K', api.node.show_info_popup, opts('Info'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('[P]arent Directory'))
    vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev [D]iagnostic'))
    vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next [D]iagnostic'))
    vim.keymap.set('n', 'cD', api.tree.change_root_to_parent, opts('[C]hange [D]irectory parent'))
    vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('[C]hange [D]irectory'))
    vim.keymap.set('n', 'd', api.fs.cut, opts('[D]elete and yank'))
    vim.keymap.set('n', 'e', api.tree.expand_all, opts('[E]xpand'))
    vim.keymap.set('n', 'f', api.tree.search_node, opts('[F]ind'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'md', api.marks.bulk.delete, opts('[M]arked [D]elete'))
    vim.keymap.set('n', 'mf', api.marks.toggle, opts('[M]ark [F]ile'))
    vim.keymap.set('n', 'mm', api.marks.bulk.move, opts('[M]arked [M]ove'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('[P]aste'))
    vim.keymap.set('n', 'q', api.tree.close, opts('[Q]uit'))
    vim.keymap.set('n', 'rc', api.node.run.cmd, opts('[R]un [C]md'))
    vim.keymap.set('n', 'rf', api.tree.reload, opts('[R]e[F]resh'))
    vim.keymap.set('n', 'rn', api.fs.rename, opts('[R]e[N]ame'))
    vim.keymap.set('n', 'rs', api.node.run.system, opts('[R]un [S]ystem'))
    vim.keymap.set('n', 'sd', api.tree.toggle_hidden_filter, opts('[S]how [D]otfiles'))
    vim.keymap.set('n', 'sg', api.tree.toggle_git_clean_filter, opts('[S]how [G]it clean filter'))
    vim.keymap.set('n', 'sh', api.tree.toggle_custom_filter, opts('[S]how [H]idden'))
    vim.keymap.set('n', 'si', api.tree.toggle_gitignore_filter, opts('[S]how Git [I]gnore'))
    vim.keymap.set('n', 't', api.fs.create, opts('[T]ouch (New)'))
    vim.keymap.set('n', 'y', api.fs.copy.node, opts('[Y]ank'))
    vim.keymap.set('n', 'ya', api.fs.copy.absolute_path, opts('[Y]ank [A]bsolute Path'))
    vim.keymap.set('n', 'yn', api.fs.copy.filename, opts('[Y]ank [N]ame'))
    vim.keymap.set('n', 'yr', api.fs.copy.relative_path, opts('[Y]ank [R]elative Path'))
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    disable_netrw = true,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    view = {
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = function()
                -- local window_w = math.floor(screen_w * 0.4)
                local window_w = 80
                local window_h = math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get()) * 0.8)
                local center_x = (vim.opt.columns:get() - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w,
                    height = window_h,
                }
            end,
        },
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = '[E]x Tree' })
vim.keymap.set("n", "<leader>E", "<cmd>cd %:h<CR><cmd>NvimTreeToggle<CR>", { desc = 'cd [E]x Tree' })
vim.keymap.set("n", "<leader>oo", "<cmd>cd ~/.config/nvim<CR><cmd>NvimTreeToggle<CR>", { desc = '[O]pen [O]ption' })
