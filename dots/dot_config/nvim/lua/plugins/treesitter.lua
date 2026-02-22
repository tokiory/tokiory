return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup {
      sync_install = false,
      ensure_installed = { "lua", "go", "markdown", "markdown_inline", "yaml", "diff", "typescript", "javascript", "tsx", "json", "jsonc", "json5", "zig", "gomod", "gosum", "python" },
      auto_install = true,
      ignore_install = { "" },
      highlight = { enable = true },
    }
  end,
}
