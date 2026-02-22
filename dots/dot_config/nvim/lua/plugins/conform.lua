local function format()
  require('conform').format({ async = true, lsp_fallback = true })
end

return {
  'stevearc/conform.nvim',
  keys = {
    { 'gf', format, desc = 'Show buffer symbols' },
  },
  event = { "BufWritePre", "BufNewFile" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'first',
      filter = function(client)
        return client.name == 'eslint'
      end,
    },
    formatters_by_ft = {
      lua = { "stylua", lsp_format = "fallback" },
      go = { "gofmt", "goimports", stop_after_first = false },
      zig = { "zigfmt" },
      vue = { "prettier", stop_after_first = true },
      javascript = { "prettier", stop_after_first = true },
      javascriptreact = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },
  }
}
