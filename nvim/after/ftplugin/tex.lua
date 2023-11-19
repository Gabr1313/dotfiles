-- vim.opt.spell = true
-- vim.opt.spelllang = "en_gb"
-- vim.keymap.set("i", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })
-- vim.keymap.set("n", "<C-s>", "<Esc>[s1z=`]a", { desc = "[S]pell correct" })

local function toggle_conceallevel()
    if vim.wo.conceallevel == 0 then
        vim.wo.conceallevel = 2
    else
        vim.wo.conceallevel = 0
    end
end

vim.keymap.set("n", "\\cc", "<cmd>w<CR><cmd>VimtexCompile<CR>", { desc = 'VimTex [C]ompile' })
vim.keymap.set("v", "\\cc", "<cmd>VimtexCompileSelected<CR><CR>", { desc = 'VimTex [C]ompile' })
vim.keymap.set("n", "\\cs", "<cmd>VimtexStop<CR>", { desc = 'VimTex [C]ompile [S]top' })
vim.keymap.set("n", "\\e", "<cmd>VimtexErrors<CR>", { desc = 'VimTex [E]rrors' })
vim.keymap.set("n", "\\v", "<cmd>VimtexView<CR>", { desc = 'VimTex [V]iew' })
vim.keymap.set("n", "\\t", "<cmd>VimtexTocToggle<CR>", { desc = 'VimTex [T]oc' })
vim.keymap.set("n", "\\i", "<cmd>VimtexInfo<CR>", { desc = 'VimTex [I]nfo' })
vim.keymap.set("n", "\\l", toggle_conceallevel, { desc = '' })
vim.keymap.set("n", "<leader>lf", "<cmd>w<CR><cmd>!bibtex-tidy % -m<CR><cmd>e!<CR>", { desc = '' })

vim.keymap.set('n', 'ds$', '<plug>(vimtex-env-delete-math)')
vim.keymap.set('n', 'cs$', '<plug>(vimtex-env-change-math)')
vim.keymap.set('n', 'dse', '<plug>(vimtex-env-delete)')
vim.keymap.set('n', 'cse', '<plug>(vimtex-env-change)')
vim.keymap.set('n', 'tse', '<plug>(vimtex-env-toggle-star)')
vim.keymap.set('n', 'ts$', '<plug>(vimtex-env-toggle-math)')
vim.keymap.set('n', 'dsc', '<plug>(vimtex-cmd-delete)')
vim.keymap.set('n', 'csc', '<plug>(vimtex-cmd-change)')
vim.keymap.set('n', 'tsc', '<plug>(vimtex-cmd-toggle-star)')
vim.keymap.set('n', 'tsf', '<plug>(vimtex-cmd-toggle-frac)')
vim.keymap.set('x', 'tsf', '<plug>(vimtex-cmd-toggle-frac)')
vim.keymap.set('n', 'dsd', '<plug>(vimtex-delim-delete)')
vim.keymap.set('n', 'csd', '<plug>(vimtex-delim-change-math)')
vim.keymap.set('n', 'tsd', '<plug>(vimtex-delim-toggle-modifier)')
vim.keymap.set('x', 'tsd', '<plug>(vimtex-delim-toggle-modifier)')
vim.keymap.set('n', 'tsD', '<plug>(vimtex-delim-toggle-modifier-reverse)')
vim.keymap.set('x', 'tsD', '<plug>(vimtex-delim-toggle-modifier-reverse)')

vim.keymap.set('n', '%', '<plug>(vimtex-%)')
vim.keymap.set('x', '%', '<plug>(vimtex-%)')
vim.keymap.set('o', '%', '<plug>(vimtex-%)')

vim.keymap.set('x', 'id', '<plug>(vimtex-id)')
vim.keymap.set('x', 'ad', '<plug>(vimtex-ad)')
vim.keymap.set('o', 'id', '<plug>(vimtex-id)')
vim.keymap.set('o', 'ad', '<plug>(vimtex-ad)')
vim.keymap.set('x', 'i$', '<plug>(vimtex-i$)')
vim.keymap.set('x', 'a$', '<plug>(vimtex-a$)')
vim.keymap.set('o', 'i$', '<plug>(vimtex-i$)')
vim.keymap.set('o', 'a$', '<plug>(vimtex-a$)')
vim.keymap.set('x', 'iP', '<plug>(vimtex-iP)')
vim.keymap.set('x', 'aP', '<plug>(vimtex-aP)')
vim.keymap.set('o', 'iP', '<plug>(vimtex-iP)')
vim.keymap.set('o', 'aP', '<plug>(vimtex-aP)')
vim.keymap.set('x', 'im', '<plug>(vimtex-im)')
vim.keymap.set('x', 'am', '<plug>(vimtex-am)')
vim.keymap.set('o', 'im', '<plug>(vimtex-im)')
vim.keymap.set('o', 'am', '<plug>(vimtex-am)')
vim.keymap.set('x', 'ic', '<plug>(vimtex-targets-i)c')
vim.keymap.set('x', 'ac', '<plug>(vimtex-targets-a)c')
vim.keymap.set('o', 'ic', '<plug>(vimtex-targets-i)c')
vim.keymap.set('o', 'ac', '<plug>(vimtex-targets-a)c')
vim.keymap.set('x', 'ie', '<plug>(vimtex-ie)')
vim.keymap.set('x', 'ae', '<plug>(vimtex-ae)')
vim.keymap.set('o', 'ie', '<plug>(vimtex-ie)')
vim.keymap.set('o', 'ae', '<plug>(vimtex-ae)')
vim.keymap.set('x', 'ic', '<plug>(vimtex-ic)')
vim.keymap.set('x', 'ac', '<plug>(vimtex-ac)')
vim.keymap.set('o', 'ic', '<plug>(vimtex-ic)')
vim.keymap.set('o', 'ac', '<plug>(vimtex-ac)')

-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local types = require("luasnip.util.types")

luasnip.setup({
    keep_roots = true,
    link_roots = true,
    link_children = true,

    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    ext_base_prio = 300,
    ext_prio_increase = 1,
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
})

local function copy(args)
    return args[1]
end

luasnip.add_snippets("tex", {
    s( -- begin
        "\\beg",
        { t({ "\\begin{" }), i(1), t({ "}", "\t" }), i(0), t({ "", "\\end{" }), f(copy, 1), t({ "}" }), }
    ),
    s( -- math
        "\\math",
        { t({ "\\[", "" }), i(0), t({ "", "\\]" }), }
    ),
    s( -- texttt
        "\\tt",
        { t({ "\\texttt{" }), i(1), t({ "}" }), i(0) }
    ),
    s( -- chapter
        "\\chap",
        { t({ "\\chapter{" }), i(1), t({ "}", "" }), i(0) }
    ),
    s( -- section
        "\\sek",
        { t({ "\\section{" }), i(1), t({ "}", "" }), i(0) }
    ),
    s( -- section
        "\\ssek",
        { t({ "\\subsection{" }), i(1), t({ "}", "" }), i(0) }
    ),
    s( -- section
        "\\sssek",
        { t({ "\\subsubsection{" }), i(1), t({ "}", "" }), i(0) }
    ),
    s( -- subscript
        { trig = "([A-Za-z])_(%d%d)", regTrig = true },
        f(function(_, snip) return snip.captures[1] .. "_{" .. snip.captures[2] .. "}" end, {})
    ),
    s( -- superscript
        { trig = "([A-Za-z])^(%d%d)", regTrig = true },
        f(function(_, snip) return snip.captures[1] .. "^{" .. snip.captures[2] .. "}" end, {})
    ),
    s( -- fraction
        "//",
        { t({ "\\frac{" }), i(1), t({ "}{" }), i(2), t({ "}" }), i(0), }
    ),
    s( -- fraction digit
        { trig = "(%d+)/", regTrig = true },
        { f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" end, {}), i(1), t({ "}" }), i(0), }
    ),
    s( -- fraction ()
        { trig = "%((.+)%)/", regTrig = true },
        { f(function(_, snip) return "\\frac{" .. snip.captures[1] .. "}{" end, {}), i(1), t({ "}" }), i(0), }
    ),
    s( -- overline
        { trig = "([A-Za-z])\\ov", regTrig = true },
        { f(function(_, snip) return "\\overline{" .. snip.captures[1] .. "}" end, {}), }
    ),
    s( -- hat
        { trig = "([A-Za-z])\\ha", regTrig = true },
        { f(function(_, snip) return "\\hat{" .. snip.captures[1] .. "}" end, {}), }
    ),
    s( -- vec
        { trig = "([A-Za-z])\\ve", regTrig = true },
        { f(function(_, snip) return "\\vec{" .. snip.captures[1] .. "}" end, {}), }
    ),
}, {
    type = "autosnippets",
    key = "tex",
})
