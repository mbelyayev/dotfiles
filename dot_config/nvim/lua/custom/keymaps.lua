vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>w', vim.cmd.write, { desc = "[W]rite File" })

-- Netrw
vim.keymap.set('n', '<leader>e.', vim.cmd.Ex)

-- Preview colorschemes
vim.keymap.set('n', '<leader>st', '<cmd>Telescope colorscheme enable_preview=true<CR>')
