local utils = {}

-- map is shortcut for vim.keymap.set
function utils.map(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

function utils.bufmap(keys, func, desc, buf, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc })
end

return utils
