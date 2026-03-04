local show = function(buf_id, items, query)
  local short_items = items

  for i, item in ipairs(items) do
    -- What the hell does it do?
    short_items[i] = vim.fn.fnamemodify(item, ':~:.')
  end

  MiniPick.default_show(buf_id, items, query, { show_icons = true })
end

local items = function()
  local result = vim.fn.systemlist("rg --files --hidden --no-ignore-vcs --glob !.git")
  return result
end

local choose = function(item)
  vim.schedule(function()
    vim.cmd("edit " .. vim.fn.fnameescape(item))
  end)
end

local mappings = {
  quickfix = {
    char = '<C-q>',
    func = function()
      local minipick = require('mini.pick');
      local matches = minipick.get_picker_matches() or {}
      local marked = matches.marked or {}
      local all = matches.all or {}
      local items = (#marked > 0) and marked or all
      minipick.default_choose_marked(items)
      return true
    end,
  },
}

return function(local_opts)
  local minipick = require('mini.pick');
  local cwd = (local_opts or {}).cwd or vim.fn.getcwd()

  return minipick.start({
    mappings = mappings,
    source = {
      name = 'Files',
      show = show,
      items = items,
      choose = choose,
      window = {
        prompt_prefix = '📝 [open]: '
      },
    },
  })
end
