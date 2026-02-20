return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "giuxtaposition/blink-cmp-copilot",
  },
  version = '1.*',
  config = function()
    local blink = require('blink.cmp')

    blink.setup({
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      cmdline = { completion = { ghost_text = { enabled = true } } },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        ghost_text = { enabled = false },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          }
        }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    })
  end,
}
