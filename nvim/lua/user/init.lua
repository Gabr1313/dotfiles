require("user.packer")
require("user.remap")
require("user.set")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

function R(name)
  require("plenary.reload").reload_module(name)
end

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

-- delete spaces on write in blank line
-- local deleteSpaces_group = augroup('DeleteSpaces', {})
-- autocmd({"BufWritePre"}, {
--     group = deleteSpaces_group,
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })

-- When browsing in `:Ex`, will re-use the same window
vim.g.netrw_browse_split = 0
-- No banner
vim.g.netrw_banner = 0
-- Size of `:Sex` `:Vex` ...
vim.g.netrw_winsize = 25
