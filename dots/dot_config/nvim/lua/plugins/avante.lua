return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ao", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
    { "<leader>ai", "<cmd>AvanteAsk<cr>", desc = "Ask Avante" },
  },
  config = function(_, opts)
    require("avante").setup(opts)

    local function open_model_selector()
      local Config = require("avante.config")

      if not Config.acp_providers[Config.provider] then
        require("avante.model_selector").open()
        return
      end

      local provider_name = Config.provider
      local acp_provider = Config.acp_providers[provider_name]
      if not acp_provider then
        vim.notify("No ACP provider configuration found", vim.log.levels.WARN)
        return
      end

      local models = vim.fn.systemlist({ acp_provider.command, "models" })
      if vim.v.shell_error ~= 0 or not models or #models == 0 then
        vim.notify("Failed to load models from opencode", vim.log.levels.ERROR)
        return
      end

      local items = {}
      for _, model in ipairs(models) do
        if model ~= "" then table.insert(items, model) end
      end

      if #items == 0 then
        vim.notify("No models returned by opencode", vim.log.levels.WARN)
        return
      end

      vim.ui.select(items, {
        prompt = "Select Avante ACP model",
      }, function(choice)
        if not choice then return end
        Config.override({
          acp_providers = {
            [provider_name] = vim.tbl_deep_extend("force", Config.acp_providers[provider_name], { model = choice }),
          },
        })
        vim.notify("Switched ACP model to " .. choice, vim.log.levels.INFO)
      end)
    end

    pcall(vim.api.nvim_del_user_command, "AvanteModels")
    vim.api.nvim_create_user_command("AvanteModels", open_model_selector, { desc = "avante: show models" })
  end,
  opts = {
    provider = "opencode",
    auto_suggestions_provider = "opencode",
    acp_providers = {
      opencode = {
        command = "opencode",
        args = { "acp" },
        model = "openai/gpt-5.3-codex",
      },
    },
    behaviour = {
      auto_set_keymaps = false,
    },
  },
}
