return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ao", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
    { "<leader>ai", "<cmd>AvanteAsk<cr>", desc = "Ask Avante" },
  },
  opts = {
    provider = "opencode",
    auto_suggestions_provider = "opencode",
    acp_providers = {
      opencode = {
        command = "opencode",
        args = { "acp" },
      },
    },
    behaviour = {
      auto_set_keymaps = false,
    },
  },
}
