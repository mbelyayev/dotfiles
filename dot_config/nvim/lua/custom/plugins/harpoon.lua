local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add({
  { src = (gh("ThePrimeagen/harpoon")), version = "harpoon2" },
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon list" })
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Open file @ index 1" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Open file @ index 2" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Open file @ index 3" })
vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end, { desc = "Open file @ index 4" })
