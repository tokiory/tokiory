return {
  'MagicDuck/grug-far.nvim',
  keys = {
    { "<leader>/", "<cmd>GrugFar<cr>", desc = "Open search & replace" }
  },
  config = function()
    require('grug-far').setup({
    });
  end
}
