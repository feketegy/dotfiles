-- Statusline

local M = {
  'nvim-lualine/lualine.nvim',
}

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.opts = {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'lsp_status', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}

return M
