local function format()
  require('conform').format()
end

return {
  'stevearc/conform.nvim',
  keys = {
    { 'gf', format, desc = 'Show buffer symbols' },
  },
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
      vue = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },
  }
}
