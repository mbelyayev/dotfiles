local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'rose-pine/neovim' }
vim.pack.add { gh 'rebelot/kanagawa.nvim' }

vim.cmd.colorscheme 'rose-pine'
