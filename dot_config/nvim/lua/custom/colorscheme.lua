-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
require 'custom.plugins.colorschemes.everforest'
require 'custom.plugins.colorschemes.rose-pine'
require 'custom.plugins.colorschemes.kanagawa'

-- Change the name of the colorscheme plugin below to change to a different colorscheme.
vim.cmd.colorscheme 'everforest'

-- Dependening on colorscheme, set buffer windows (active & inactive),
-- floating windows, and popup menus to be transparent.
if vim.g.colors_name == 'everforest' then
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = 'Grey' })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#232a2e' })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#232a2e' })
  vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none', fg = '#232a2e' })
  vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { bg = '#232a2e', fg = '#d3c6aa' })
  vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = '#232a2e', fg = '#d3c6aa' })
  vim.api.nvim_set_hl(0, 'NoiceCmdline', { bg = 'none', fg = '#d3c6aa' })
  vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { bg = 'none', fg = '#A7C080' })
  vim.api.nvim_set_hl(0, 'NoiceCmdlineCommand', { fg = 'White' })
end
