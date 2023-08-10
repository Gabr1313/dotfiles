require('rose-pine').setup({
    disable_background = true,
    disable_float_background = true,
})

require('catppuccin').setup({
    flavour = 'mocha', -- 'latte', 'frappe', 'macchiato', 'mocha'
    transparent_background = true,
})

require('tokyonight').setup({
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    }
})

require('gruvbox').setup({
    bold = false,
    transparent_mode = true,
})

require('onedark').setup({
    style = 'cool', -- 'dark' 'darker' 'cool' 'deep' 'warm' 'warmer' 'light'
    transparent = true,
    lualine = {
        transparent = true,
    },
    highlights = {
        ["@constructor"] = { fmt = 'none' },
    },
})

function ColorMyPencils(color)
    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.cmd [[highlight GitSignsAdd guibg=NONE]]
    vim.cmd [[highlight GitSignsChange guibg=NONE]]
    vim.cmd [[highlight GitSignsDelete guibg=NONE]]
end

ColorMyPencils()
