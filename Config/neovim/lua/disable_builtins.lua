-- Выключение встроенных плагинов
-- https://www.reddit.com/r/neovim/comments/p1qlbn/help_speeding_up_startup_time_disabling_builtin/
local builtInPlugins = {
  "zip",
  "zipPlugin",
  "gzip",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "logipat"
}

for null, plugin in pairs(builtInPlugins) do
  vim.g["loaded_" .. plugin] = 1
end
