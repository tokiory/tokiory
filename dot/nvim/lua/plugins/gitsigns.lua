return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {},
  keys = {
    -- Navigation
    {"]c", '<cmd>Gitsigns next_hunk<cr>', desc = 'Show next hunk'},
    {"[c", '<cmd>Gitsigns prev_hunk<cr>', desc = 'Show previous hunk'},

    -- Operations with hunks
    {"<leader>'", '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview the hunk'},
    {"<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = 'Reset the hunk'},
    {"<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = 'Stage the hunk'},
  }
}
