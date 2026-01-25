return {
  'chomosuke/typst-preview.nvim',
  lazy = false,
  ft = 'typst',
  version = '1.*',
  opts = {},
  config = function()
      require('typst-preview').setup()
  end
}
