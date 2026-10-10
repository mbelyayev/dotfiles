local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'OXY2DEV/markview.nvim' }

require('markview').setup {
  markdown = {
    headings = {
      enable = true,
      heading_1 = { style = 'simple', hl = 'MarkviewHeading1' },
      heading_2 = { style = 'simple', hl = 'MarkviewHeading2' },
      heading_3 = { style = 'simple', hl = 'MarkviewHeading3' },
      heading_4 = { style = 'simple', hl = 'MarkviewHeading4' },
      heading_5 = { style = 'simple', hl = 'MarkviewHeading5' },
      heading_6 = { style = 'simple', hl = 'MarkviewHeading6' },
      setext_1 = {
        style = 'decorated',
        sign = '󰌕 ',
        sign_hl = 'MarkviewHeading1Sign',
        icon = ' ',
        hl = 'MarkviewHeading1',
        border = '▂',
      },
      setext_2 = {
        style = 'decorated',
        sign = '󰌖 ',
        sign_hl = 'MarkviewHeading2Sign',
        icon = ' ',
        hl = 'MarkviewHeading2',
        border = '▁',
      },
      shift_width = 1,
      org_indent = false,
      org_indent_wrap = true,
      org_shift_char = ' ',
      org_shift_width = 1,
    },
  },
}
