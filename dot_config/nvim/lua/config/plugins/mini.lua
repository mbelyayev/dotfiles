return {
  {
    'nvim-mini/mini.statusline',
    enabled = true,
    version = '*',
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup { use_icons = true, }
    end,
  },
}
