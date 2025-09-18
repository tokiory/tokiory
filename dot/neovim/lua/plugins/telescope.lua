-- Ignorance is a bliss
vim.deprecate = function() end

local function quickfix_toggle()
  local is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then is_open = true end
  end
  if is_open then
    vim.cmd "cclose"
  else
    vim.cmd "copen"
  end
end

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  lazy = false,
  enabled = false,
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = vim.tbl_extend('force',
        require('telescope.themes').get_ivy(),
        {
          preview = false,
          prompt_prefix = ' ▶︎ ',
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
          end,
        }),
    })
    telescope.load_extension('file_browser')
  end,
  keys = {
    { '<leader>m', '<cmd>Telescope diagnostics<cr>',            desc = 'Show diagnostics' },
    { '<leader>o', '<cmd>Telescope find_files<cr>',             desc = 'Find files' },
    { '<leader>g', '<cmd>Telescope git_status<cr>',             desc = 'Show git status' },
    { '<leader>p', '<cmd>Telescope oldfiles only_cwd=true<cr>', desc = 'Show old files' },
    { 'g/',        '<cmd>Telescope live_grep<cr>',              desc = 'Find a file by word' },

    -- LSP things

    { 'gd',        '<cmd>Telescope lsp_definitions<cr>',        desc = 'Go to definition' },
    { 'gA',        '<cmd>Telescope lsp_references<cr>',         desc = 'Go to references' },
    { 'gI',        '<cmd>Telescope lsp_implementations<cr>',    desc = 'Go to implementations' },
    { 'gS',        '<cmd>Telescope lsp_workspace_symbols<cr>',  desc = 'Show workspace symbols' },
    { 'gs',        '<cmd>Telescope lsp_document_symbols<cr>',   desc = 'Show buffer symbols' },


    -- Yup, we're defining quickfix list keys here
    { '<leader>q', quickfix_toggle,                             desc = 'Toggle quickfix list' }
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
  }
}
