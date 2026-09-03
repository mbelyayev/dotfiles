-- Iterate over all Lua files in the custom directory and load them
local custom_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom' )
for file_name, type in vim.fs.dir(custom_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.' .. module)
  end
end
