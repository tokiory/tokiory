return {
  "folke/snacks.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  lazy = false,
  keys = {
    { '<leader>o', function() Snacks.picker.smart() end, desc = 'Find Files' },
    { '<leader>m', function() Snacks.picker.diagnostics() end, desc = 'Show diagnostics' },
    { "<leader>g", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>p", function() Snacks.picker.recent() end, desc = "Show recent files" },
    { "<leader>P", function() Snacks.picker.buffers() end, desc = "Show recent buffers" },
    {
      'g/',
      function() Snacks.picker.grep() end,
      desc = 'Find a file by word'
    },

    --
    -- -- LSP things
    --
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition" },
    { "gA", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Go to References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Explorer
    { "<leader>v", function() Snacks.picker.explorer() end, desc = "Open Explorer" },
  },
  ---@type snacks.Config
  opts = {
    picker = {
      replace_netrw = true
    }
  }
}
