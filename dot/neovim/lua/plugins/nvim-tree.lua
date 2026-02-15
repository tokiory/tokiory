return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  keys = {
    { "<leader>v", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    git = {
      enable = true,
      ignore = true,
      timeout = 400,
    },
    view = {
      side = "right",
      width = 30,
    }
  },
}
