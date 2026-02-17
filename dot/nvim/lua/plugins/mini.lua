return {
  'nvim-mini/mini.nvim',
  version = false,
  lazy = false,
  keys = {
    -- { '<leader>v', function() require('mini.files').open() end, desc = 'Open file explorer' },
  },
  config = function()
    require('mini.pairs').setup()
    -- require('mini.diff').setup()
    -- require('mini.icons').setup()
    -- require('mini.files').setup()
  end
}

