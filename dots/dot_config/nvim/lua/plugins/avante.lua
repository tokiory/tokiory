return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
     {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    provider = "opencode",
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
      auto_set_keymaps = true,
      auto_approve_tool_permissions = false,
    },
    input = {
      provider = "native",
    },
    selector = {
      provider = "telescope",
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
