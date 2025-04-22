-- Autopair opening/closing tags

local M = {
  'windwp/nvim-autopairs',
}

M.event = 'InsertEnter'

M.opts = {
  disable_filetype = { 'TelescopePrompt' },
  disable_in_macro = false,
  check_ts = true,
}

return M
