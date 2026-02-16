local block_copilot_suggesions = function()
  -- Block the normal Copilot suggestions
  vim.api.nvim_create_augroup("github_copilot", { clear = true })
  vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
    group = "github_copilot",
    callback = function(args)
      vim.fn["copilot#On" .. args.event]()
    end,
  })
  vim.fn["copilot#OnFileType"]()
end

return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  init = function()
    vim.g.copilot_no_maps = true
  end,
  version = '1.*',
  config = function()
    local blink = require('blink.cmp')
    block_copilot_suggesions()

    blink.setup({
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    })
  end,
}
