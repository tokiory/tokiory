return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { "<leader>gs", function() require('telescope.builtin').git_status() end,  desc = "Git Status" },
    { "<leader>P",  function() require('telescope.builtin').buffers() end, desc = "Show recent buffers" },
    {
      '<leader>o',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Find Files'
    },
    { "<leader>p", function() require('telescope.builtin').oldfiles({ only_cwd = true }) end, desc = "Show recent files" },
    { '<leader>m', function() require('telescope.builtin').diagnostics() end,                     desc = 'Show diagnostics' },
    {
      'g/',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Find a file by word'
    },
    { "gd", function() require('telescope.builtin').lsp_definitions() end,      desc = "Go to Definition" },
    { "gA", function() require('telescope.builtin').lsp_references() end,       nowait = true,                 desc = "Go to References" },
    { "gI", function() require('telescope.builtin').lsp_implementations() end,   desc = "Goto Implementation" },
    { "gs", function() require('telescope.builtin').lsp_document_symbols() end,  desc = "LSP Symbols" },
    { "gS", function() require('telescope.builtin').lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }
}
