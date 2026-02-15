return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {},
  keys = {
    {"g'", '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview the hunk'},
    {"]c", '<cmd>Gitsigns next_hunk<cr>', desc = 'Show next hunk'},
    {"[c", '<cmd>Gitsigns prev_hunk<cr>', desc = 'Show previous hunk'},
  }
}
