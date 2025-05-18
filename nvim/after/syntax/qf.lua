vim.fn.matchadd("qfError",   "error")
vim.fn.matchadd("qfWarning", "warning")

vim.api.nvim_set_hl(0, "qfError",      { link = "DiagnosticSignError" })
vim.api.nvim_set_hl(0, "qfWarning",    { link = "DiagnosticSignWarn" })
vim.api.nvim_set_hl(0, "qfLineNr",     { link = "DiagnosticSignHint" })
vim.api.nvim_set_hl(0, "QuickFixLine", { bold = true })
-- vim.api.nvim_set_hl(0, "qfFileName", {})
