return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "github/copilot.vim",
  },
  keys = {
    { "<C-CR>", "<cmd>CodeCompanion<cr>", desc = "Inline suggesion", mode = {'v', 'n'} },
  },
  opts = {
    interactions = {
      chat = {
        keymaps = {
          clear = false,
        },
        adapter = {
          name = "copilot",
          model = "gpt-5.3-codex",
        },
      },
      inline = {
        keymaps = {
          stop = {
            modes = { n = "<leader>aq" },
            index = 4,
            callback = "keymaps.stop",
            description = "Stop request",
          },
          accept_change = {
            modes = { n = "<leader>aa" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "<leader>ar" },
            opts = { nowait = true },
            description = "Reject the suggested change",
          },
        },
        adapter = {
          name = "copilot",
          model = "gpt-5-mini",
        },
      },
      cmd = {
        adapter = {
          name = "copilot",
          model = "gpt-5-mini",
        },
      },
      background = {
        adapter = {
          name = "copilot",
          model = "gpt-5-mini",
        },
      },
    },
  },
}
