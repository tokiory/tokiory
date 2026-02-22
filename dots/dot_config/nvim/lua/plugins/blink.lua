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
          window = {
            border = "rounded",
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = false },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          }
        },
        menu = {
          border = "rounded",
          scrolloff = 1,
          scrollbar = false,
          draw = {
            padding = 1,
            gap = 1,
            columns = {
              { "kind_icon" },
              { "label",      "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
          },
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
