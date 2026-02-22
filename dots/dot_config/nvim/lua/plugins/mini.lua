local toggle_minifiles = function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()

  if not MiniFiles.close() then
    MiniFiles.open(path)
    MiniFiles.reveal_cwd()
  end
end

return {
  'nvim-mini/mini.nvim',
  version = false,
  lazy = false,
  keys = {
    { '<leader>v',  toggle_minifiles,                              desc = 'Toggle file explorer' },

    { "<leader>gs", function() MiniExtra.pickers.hunks() end,  desc = "Git Status" },
    { "<leader>P",  function() MiniPick.builtin.buffers() end,     desc = "Show recent buffers" },
    { '<leader>o',  function() MiniPick.builtin.files() end,       desc = 'Find Files' },
    { "<leader>p",  function() MiniExtra.pickers.oldfiles() end,   desc = "Show recent files" },
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

    { "]c", function() MiniDiff.goto_hunk("next") end,                            desc = "Go to next hunk" },
    { "[c", function() MiniDiff.goto_hunk("prev") end,                            desc = "Go to next hunk" },

  },
  config = function()
    require('mini.pairs').setup()
    require('mini.pick').setup()
    require('mini.extra').setup()
    require('mini.files').setup()
    require('mini.diff').setup({
      view = {
        signs = { add = '+', change = '~', delete = '-' },
      }
    })
    -- require('mini.icons').setup()
    -- require('mini.files').setup()


    vim.ui.select = function(items, opts, on_choice)
      local start_opts = { window = { config = { width = vim.o.columns } } }
      return MiniPick.ui_select(items, opts, on_choice, start_opts)
    end
  end
}
