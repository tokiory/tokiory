return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { '<leader>m', '<cmd>FzfLua diagnostics_document<cr>',            desc = 'Show diagnostics' },
    { '<leader>M', '<cmd>FzfLua diagnostics_workspace<cr>',            desc = 'Show diagnostics' },
    { '<leader>o', '<cmd>FzfLua files<cr>',             desc = 'Find files' },
    { '<leader>g', '<cmd>FzfLua git_status<cr>',             desc = 'Show git status' },
    { '<leader>p', '<cmd>FzfLua oldfiles only_cwd=true<cr>', desc = 'Show old files' },
    { 'g/',        '<cmd>FzfLua live_grep<cr>',              desc = 'Find a file by word' },

    -- LSP things

    { 'gd',        '<cmd>FzfLua lsp_definitions<cr>',        desc = 'Go to definition' },
    { 'gA',        '<cmd>FzfLua lsp_references<cr>',         desc = 'Go to references' },
    { 'gI',        '<cmd>FzfLua lsp_implementations<cr>',    desc = 'Go to implementations' },
    { 'gS',        '<cmd>FzfLua lsp_workspace_symbols<cr>',  desc = 'Show workspace symbols' },
    { 'gs',        '<cmd>FzfLua lsp_document_symbols<cr>',   desc = 'Show buffer symbols' },
  },

}
