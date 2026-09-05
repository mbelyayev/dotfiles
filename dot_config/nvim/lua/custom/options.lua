-- Don't wrap text; disorienting
vim.o.wrap = false

-- Gives floating/popup menu windows border and exposes highlight group customization.
-- See `:help pumborder`. Setting winborder got me what I needed with colorscheme.lua.
vim.o.winborder = 'rounded'

-- Override settings set for man file types by
-- opt/homebrew/Cellar/neovim/<version>/share/nvim/runtime/ftplugin/man.vim
vim.api.nvim_create_autocmd('FileType', {
  pattern = "man",
  callback = function()
    vim.opt_local.relativenumber = true
  end
})
