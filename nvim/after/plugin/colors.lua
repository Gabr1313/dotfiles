require('rose-pine').setup({
  disable_background = true,
  disable_float_background = true,
})

require('catppuccin').setup({
  transparent_background = true,
})

require('tokyonight').setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  }
})

require('gruvbox').setup({
  transparent_mode = true,
})

require('onedark').setup({
  transparent = true,
  lualine = {
    transparent = true, -- lualine center bar transparency
  },
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  -- for ./bufferLine.lua
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#8bb8c0 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineContextStart guisp=#8bb8c0 gui=underline]]

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
