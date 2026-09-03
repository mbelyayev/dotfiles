-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
require('custom.plugins.colorschemes.everforest')
require('custom.plugins.colorschemes.rose-pine')
require('custom.plugins.colorschemes.kanagawa')

-- Change the name of the colorscheme plugin below to change to a different colorscheme.
vim.cmd.colorscheme 'everforest'

-- No matter the colorscheme, set buffer windows (active & inactive), 
-- floating windows, and popup menus to be transparent.
vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalNC", { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = 'none' })
vim.api.nvim_set_hl(0, "Pmenu", { bg = 'none' })

