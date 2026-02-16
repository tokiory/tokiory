return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'fang2hou/blink-copilot',
  },
  init = function()
    vim.g.copilot_no_maps = true
  end,
  version = '1.*',
  config = function()
    local blink = require('blink.cmp')

    blink.setup({
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    })
  end,
}
