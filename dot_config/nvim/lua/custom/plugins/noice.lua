local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'MunifTanjim/nui.nvim' }
vim.pack.add { gh 'rcarriga/nvim-notify' }
vim.pack.add {
  {
    src = gh 'folke/noice.nvim',
    -- monkeypatch for 'NoiceCmdlineCommand' highlight group access.
    version = 'd8d99532dba3e2690f3932afd7b7c54466f80a53',
  },
}

local notify = require 'notify'
notify.setup {
  merge_duplicates = true,
  background_colour = 'NotifyBackground',
  fps = 60,
  icons = {
    DEBUG = '',
    ERROR = '',
    INFO = '',
    TRACE = '✎',
    WARN = '',
  },
  level = 2,
  minimum_width = 50,
  render = 'default',
  stages = 'static',
  time_formats = {
    notification = '%T',
    notification_history = '%FT%T',
  },
  timeout = 5000,
  top_down = true,
}

vim.notify = notify

local cmdline_format_opts = {
  win_options = {
    winhighlight = {
      FloatBorder = 'Grey',
      FloatTitle = 'Pmenu',
    },
  },
}

require('noice').setup {
  ---@type NoiceConfigViews
  routes = {
    {
      filter = { event = 'msg_show', find = 'written' },
      view = 'notify',
      opts = { title = 'File saved' },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = '50%',
        col = '50%',
      },
    },
  },
  cmdline = {
    format = {
      cmdline = { icon_hl_group = 'White', opts = cmdline_format_opts },
      search_down = { opts = cmdline_format_opts },
      search_up = { opts = cmdline_format_opts },
      filter = { icon_hl_group = 'White', opts = cmdline_format_opts },
      lua = { icon_hl_group = 'White', opts = cmdline_format_opts },
      help = { icon_hl_group = 'White', opts = cmdline_format_opts },
      input = { opts = cmdline_format_opts },
    },
  },
  lsp = {
    progress = {
      enabled = false,
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
}
