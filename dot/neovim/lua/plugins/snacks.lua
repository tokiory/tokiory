return {
  "folke/snacks.nvim",
  enabled = false,
  keys = {
    {
      '<leader>m',
      function() require('snacks').picker('diagnostics') end,
      desc = 'Show diagnostics'
    },
    {
      '<leader>o',
      function() require('snacks').picker('files') end,
      desc = 'Show diagnostics'
    },
    {
      '<leader>g',
      function() require('snacks').picker('git_status') end,
      desc = 'Show diagnostics'
    },
    {
      'g/',
      function() require('snacks').picker('live_grep') end,
      desc = 'Show diagnostics'
    },
    -- { '<leader>p', '<cmd>Telescope oldfiles only_cwd=true<cr>', desc = 'Show old files' },

    -- LSP things

    { 'gd', function() require('snacks').picker('lsp_definitions') end,       desc = 'Go to definition' },
    { 'gA', function() require('snacks').picker('lsp_references') end,        desc = 'Go to references' },
    { 'gI', function() require('snacks').picker('lsp_implementations') end,   desc = 'Go to implementations' },
    { 'gS', function() require('snacks').picker('lsp_workspace_symbols') end, desc = 'Show workspace symbols' },
    { 'gs', function() require('snacks').picker('lsp_document_symbols') end,  desc = 'Show buffer symbols' },
  },
  ---@type snacks.Config
  opts = {
    picker = {
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
