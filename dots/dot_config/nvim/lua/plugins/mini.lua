return {
  'nvim-mini/mini.nvim',
  version = false,
  lazy = false,
  keys = {
    { "]c", function() MiniDiff.goto_hunk("next") end,                            desc = "Go to next hunk" },
    { "[c", function() MiniDiff.goto_hunk("prev") end,                            desc = "Go to next hunk" },
  },
  config = function()
    require('mini.pairs').setup()
    require('mini.extra').setup()
    require('mini.diff').setup({
      view = {
        signs = { add = '+', change = '~', delete = '-' },
      }
    })
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()

    vim.ui.select = function(items, opts, on_choice)
      local start_opts = { window = { config = { width = vim.o.columns } } }
      return MiniPick.ui_select(items, opts, on_choice, start_opts)
    end
  end
}
