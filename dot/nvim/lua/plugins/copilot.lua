return {
  'github/copilot.vim',
  config = function()
    -- Block the normal Copilot suggestions (blink-cmp will handle them instead)
    vim.api.nvim_create_augroup("github_copilot", { clear = true })
    vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
      group = "github_copilot",
      callback = function(args)
        vim.fn["copilot#On" .. args.event]()
      end,
    })
    vim.fn["copilot#OnFileType"]()
  end,
  enabled = true,
}
