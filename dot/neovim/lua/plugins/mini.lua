return {
  'nvim-mini/mini.nvim',
  lazy = false,
  keys = {
    { '[c',         function() require('mini.diff').goto_hunk('prev') end,                              desc = 'Prev hunk' },
    { ']c',         function() require('mini.diff').goto_hunk('next') end,                              desc = 'Next hunk' },
    { '<leader>\'', function() require('mini.diff').toggle_overlay(vim.api.nvim_get_current_buf()) end, desc = 'Toggle diff' },
  },
  config = function()
    require('mini.pairs').setup()
    require('mini.completion').setup()
    require('mini.comment').setup()
    require('mini.surround').setup()

    local diff = require('mini.diff')
    diff.setup({
      view = {
        signs = {
          add = "+",
          change = '~',
          delete = '-',
        }
      }
    })

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        fix       = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        info      = { pattern = '%f[%w]()INFO()%f[%W]', group = 'MiniHipatternsHack' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
  version = '*'
}
