require("gabri.set")
require("gabri.remap")
require("gabri.spell")
require("gabri.lazy_init") -- leave this at last

vim.api.nvim_create_autocmd('textyankpost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})
