local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add({ gh("neanias/everforest-nvim") })

require("everforest").setup({
  background = "medium",
  float_style = "dim",
  transparent_background_level = 1,
  on_highlights = function(hl, palette)
    hl.Normal = { bg = palette.none }
    hl.NormalFloat = { bg = palette.none }
    hl.FloatBorder = { fg = palette.grey2, bg = palette.none }
    hl.Pmenu = { fg = palette.grey2, bg = palette.none }
    hl.StatusLine = { bg = palette.bg1 }
    hl.StatusLineNC = { bg = palette.bg1 }
    hl.MiniStatuslineFilename = { fg = palette.fg, bg = palette.bg1 }
    hl.MiniStatuslineDevinfo = { fg = palette.fg, bg = palette.bg1 }
    hl.CursorLine = { bg = palette.bg1 }
    hl.CursorLineInactive = { bg = palette.bg_dim }
  end,
})

-- Sets everforest-config-specific CursorLineInactive highlight group 
-- to be the highlight group for cursor lines on inactive windows.
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
  callback = function()
    local current = vim.api.nvim_get_current_win()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      vim.api.nvim_set_option_value(
        "winhighlight",
        win == current
          and "CursorLine:CursorLine"
          or "CursorLine:CursorLineInactive",
        { win = win }
      )
    end
  end,
})

