local function gh(repo) return "https://github.com/" .. repo end

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

vim.pack.add({ gh("rose-pine/neovim") })
vim.pack.add({ gh("neanias/everforest-nvim") })
vim.pack.add({ gh("rebelot/kanagawa.nvim") })

require("everforest").setup({
  transparent_background_level = 2,
})
vim.cmd.colorscheme("everforest")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
