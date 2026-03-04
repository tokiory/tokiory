return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  keys = {
    { "<leader>?", "<cmd>CodeCompanionChat Toggle<CR>", desc = "[AI] Show Chat" },
    { "<leader><cr>", "<cmd>CodeCompanion<CR>",     mode = { "v", "n" },    desc = "[AI] Show Inline Prompt" },
  },
  opts = {
    display = {
      action_palette = {
        provider = "mini_pick",
        prompt = "WDYW?: ",
      }
    },
    interactions = {
      chat = {
        adapter = "copilot",
        model = "gpt-5.3-codex",
        opts = {
          completion_provider = "blink",
        },
      },
      inline = {
        adapter = "copilot",
        model = "gpt-5-mini",
      }
    }
  },
}
