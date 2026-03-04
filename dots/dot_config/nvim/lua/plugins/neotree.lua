return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>v",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree",
    },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
          ".git",
          "target",
          "dist",
          "build",
        },
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["h"] = "close_node",
        ["l"] = "open",
      },
    },
  },
}
