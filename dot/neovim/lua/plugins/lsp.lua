local VTSLS_PLUGINS = {
  vue = function()
    local vue_language_server_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"


    return {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
  end
}


local FRONTEND_FILETYPES = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
  'vue',
  'svelte',
  'astro',
  'htmlangular'
}

return {
  'neovim/nvim-lspconfig',
  lazy = false,
  keys = {
    { 'g.', vim.lsp.buf.code_action, desc = 'Show code actions' },
    { 'cd', vim.lsp.buf.rename,      desc = "Rename an entity", noremap = true }
    -- NOTE: All LSP actions are moved into telescope
  },
  config = function()
    -- We'll opt in LSP, only if project has a .git folder
    vim.lsp.config('*', {
      root_markers = { '.git' },
    })


    -- Frontend LSP
    vim.lsp.config('vtsls', {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              VTSLS_PLUGINS.vue(),
            },
          },
        },
      },
      filetypes = FRONTEND_FILETYPES,
    })

    vim.lsp.enable('vtsls')
    vim.lsp.enable('vue_ls')
    vim.lsp.enable('svelte')
    vim.lsp.enable('unocss')
    vim.lsp.enable('eslint')

    -- Backend languages LSP
    vim.lsp.enable('zls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('gopls')
    vim.lsp.enable('pyright')

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      float = {
        border = "single",
        format = function(diagnostic)
          return string.format(
            "%s (%s) [%s]",
            diagnostic.message,
            diagnostic.source,
            diagnostic.code or diagnostic.user_data.lsp.code
          )
        end,
      },
    })

    -- Unmap default keybindings
    vim.keymap.del('n', 'grn')
    vim.keymap.del('n', 'gra')
    vim.keymap.del('n', 'grr')
    vim.keymap.del('n', 'gri')
  end
}
