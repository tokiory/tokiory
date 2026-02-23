local lsp = {
  function()
    local msg = 'no_lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_clients()

    if next(clients) == nil then
      return msg
    end

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = '',
  -- color = {
  --   fg = colors.YELLOW,
  --   gui = 'bold',
  -- },
}

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      section_separators = "",
      component_separators = "",
      disabled_filetypes = { "mason", "lazy", "NvimTree" },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { lsp },
      lualine_c = { 'filename' },
      lualine_x = { 'diagnostics', 'filetype' },
      lualine_y = { 'branch', 'diff' },
      lualine_z = { 'location' }
    },
  }

}
