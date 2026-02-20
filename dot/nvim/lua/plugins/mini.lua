return {
  'nvim-mini/mini.nvim',
  version = false,
  lazy = false,
  keys = {
    -- { '<leader>v', function() require('mini.files').open() end, desc = 'Open file explorer' },

    { "<leader>gs", function() MiniExtra.pickers.git_files() end,  desc = "Git Status" },
    { "<leader>P",  function() MiniPick.builtin.buffers() end,     desc = "Show recent buffers" },
    { '<leader>o',  function() MiniPick.builtin.files() end,       desc = 'Find Files' },
    { "<leader>p",  function() MiniExtra.pickers.oldfiles() end,    desc = "Show recent files" },
    { '<leader>m',  function() MiniExtra.pickers.diagnostic() end, desc = 'Show diagnostics' },
    {
      'g/',
      function() MiniPick.builtin.grep_live() end,
      desc = 'Find a file by word'
    },
    { "gd", function() MiniExtra.pickers.lsp({ scope = 'declaration' }) end,      desc = "Go to Definition" },
    { "gA", function() MiniExtra.pickers.lsp({ scope = 'references' }) end,       nowait = true,                 desc = "Go to References" },
    { "gI", function() MiniExtra.pickers.lsp({ scope = 'implementation' }) end,   desc = "Goto Implementation" },
    { "gs", function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end,  desc = "LSP Symbols" },
    { "gS", function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol' }) end, desc = "LSP Workspace Symbols" },

  },
  config = function()
    require('mini.pairs').setup()
    require('mini.pick').setup()
    require('mini.extra').setup()
    -- require('mini.diff').setup()
    -- require('mini.icons').setup()
    -- require('mini.files').setup()
  end
}
