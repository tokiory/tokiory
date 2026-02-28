return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    provider = "opencode",
    -- auto_suggestions_provider = "copilot",
    acp_providers = {
      opencode = {
        -- INFO(tokiory): At the current moment avante doesn't have ability to set model for acp
        --                so we're just using default model from opencode.
        --                See opencode config "model" field for options
        command = "opencode",
        args = { "acp" },
      },
    },
    providers = {
      copilot = {
        model = "gpt-5-mini",
        timeout = 30000,
      },
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_keymaps = false,
      auto_approve_tool_permissions = false,
    },
    input = {
      provider = "native",
    },
    selector = {
      provider = "mini_pick",
      provider_opts = {},
    },
    suggestion = {
      debounce = 1000,
      throttle = 1000,
    },
    mappings = {
      ask = "<leader>aq",
      refresh = "<leader>aR",
      suggestion = {
        accept = "<leader>aa",
        dismiss = "<leader>ar",
      },
    },
  },
}
