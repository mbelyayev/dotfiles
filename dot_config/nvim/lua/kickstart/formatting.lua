local function gh(repo) return 'https://github.com/' .. repo end

do
  vim.pack.add { gh 'stevearc/conform.nvim' }

  local function strip_ansi(s) return (s:gsub('\27%[[%d;]*[A-Za-z]', '')) end

  local function notify_format_error(err)
    vim.notify(strip_ansi(tostring(err)), vim.log.levels.ERROR, {
      -- opts specific to nvim-notify (see `:h NotifyOptions` for details)
      title = 'conform.nvim',
      timeout = 5000,
    })
  end

  -- Filetypes that are auto-formatted on save
  local format_on_save_ft = {
    lua = true,
    python = true,
    htmldjango = true,
    typescript = true,
  }

  require('conform').setup {
    -- We report errors ourselves (see notify_format_error) so that
    -- format-on-save and the keymap behave the same way.
    notify_on_error = false,
    -- NOTE: `format_on_save` is intentionally not used; see the BufWritePre autocmd below.
    -- This is because it's synchronous; with notify_on_error `false` it fails silently, with `true` it reports twice.
    default_format_opts = {
      lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
    },
    -- You can also specify external formatters in here.
    formatters_by_ft = {
      -- lua: handled by stylua in lsp.lua
      markdown = { 'rumdl' },
      -- Conform can run multiple formatters sequentially. Use 'stop_after_first' to run the first available formatter from the list.
      python = { 'ruff_format' },
      htmldjango = { 'djlint' },
      javascript = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'oxfmt', 'prettierd', 'prettier', stop_after_first = true },
      -- rust = { 'rustfmt' },
    },
  }

  -- Format on save, with errors shown via vim.notify
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('conform-format-on-save', { clear = true }),
    callback = function(args)
      if not format_on_save_ft[vim.bo[args.buf].filetype] then return end
      require('conform').format({ bufnr = args.buf, timeout_ms = 500 }, function(err)
        if err then notify_format_error(err) end
      end)
    end,
  })

  vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    require('conform').format({ async = true }, function(err, did_edit)
      if err then
        notify_format_error(err)
        return
      end
      if not did_edit then return end
      require('guess-indent').set_from_buffer(nil, nil, true)
    end)
  end, { desc = '[F]ormat buffer' })
end
