local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
local CTRL_Vs = vim.api.nvim_replace_termcodes('<C-V>s', true, true, true)

local modes = setmetatable({
  -- Normal
  ['n'] = { name = 'N', hl = 'Normal' },
  ['niI'] = { name = 'N', hl = 'Normal' },
  ['niR'] = { name = 'N', hl = 'Normal' },
  ['niV'] = { name = 'N', hl = 'Normal' },
  ['nt'] = { name = 'N', hl = 'Normal' },
  ['ntT'] = { name = 'N', hl = 'Normal' },
  -- Insert
  ['i'] = { name = 'I', hl = 'Insert' },
  ['ic'] = { name = 'I', hl = 'Insert' },
  ['ix'] = { name = 'I', hl = 'Insert' },
  -- Visual
  ['v'] = { name = 'V', hl = 'Visual' },
  ['vs'] = { name = 'V', hl = 'Visual' },
  ['V'] = { name = 'VL', hl = 'Visual' }, -- visual line
  ['Vs'] = { name = 'VL', hl = 'Visual' }, -- visual line
  [CTRL_V] = { name = 'VB', hl = 'Visual' }, -- visual block
  [CTRL_Vs] = { name = 'VB', hl = 'Visual' }, -- visual block
  -- Select
  ['s'] = { name = 'S', hl = 'Insert' },
  [CTRL_S] = { name = 'SB', hl = 'Normal' }, -- s-block
  ['S'] = { name = 'SL', hl = 'Normal' },
  -- Replace
  ['r'] = { name = 'R', hl = 'Visual' },
  ['R'] = { name = 'R', hl = 'Replace' },
  ['Rc'] = { name = 'R', hl = 'Reaplce' },
  ['Rx'] = { name = 'R', hl = 'Replace' },
  ['Rv'] = { name = 'VR', hl = 'Replace' }, -- visual replace
  ['Rvc'] = { name = 'VR', hl = 'Replace' }, -- visual replace
  ['Rvx'] = { name = 'VR', hl = 'Replace' }, -- visual replace
  -- Command
  ['c'] = { name = 'C', hl = 'Command' },
  ['cv'] = { name = 'X', hl = 'Command' }, -- ex command
  ['ce'] = { name = 'X', hl = 'Command' }, -- ex command
  -- Shell
  ['!'] = { name = 'SH', hl = 'Normal' },
  -- Confirm
  ['r?'] = { name = 'Y?', hl = 'Normal' },
  -- Terminal
  ['t'] = { name = 'T', hl = 'Command' },
  -- More
  ['rm'] = { name = 'M', hl = 'Normal' },
  -- Pending
  ['no'] = { name = 'N?', hl = 'Pending' },
  ['nov'] = { name = 'N?', hl = 'Pending' },
  ['noV'] = { name = 'N?', hl = 'Pending' },
}, {
  __index = function()
    return { name = 'U', hl = 'Normal' }
  end,
})

local palette = {
  majestic_magic = '#554e75',
  maharaja = '#403a58',
  saltwater_denim = '#2b5d75',
  purple_haze = '#88719e',
  violet_velvet = '#b598d1',
  rose_laffy_taffy = '#a44360',
  enchanted_lilac = '#a6a1bb',
  pacific_blue = '#28a5c1',
  mauve = '#dab0fa',
  stellar_strawberry = '#fd6893',
  celestial = '#007292',
  grapefruit = '#ff555d',
}

local function set_hls()
  local base = vim.api.nvim_get_hl(0, {
    name = 'StatusLine',
    link = false,
    create = false,
  })

  local hi_nerd_icons = {
    SLModeNormalNI1 = { bg = '#000000', fg = palette.majestic_magic },
    SLModeNormalNI2 = { bg = palette.maharaja, fg = palette.majestic_magic },
    SLModeInsertNI1 = { bg = base.bg, fg = palette.saltwater_denim },
    SLModeInsertNI2 = { bg = palette.maharaja, fg = palette.saltwater_denim },
    SLModeVisualNI1 = { bg = base.bg, fg = palette.purple_haze },
    SLModeVisualNI2 = { bg = palette.maharaja, fg = palette.purple_haze },
    SLModeReplaceNI1 = { bg = base.bg, fg = palette.violet_velvet },
    SLModeReplaceNI2 = { bg = palette.maharaja, fg = palette.violet_velvet },
    SLModeCommandNI1 = { bg = base.bg, fg = palette.rose_laffy_taffy },
    SLModeCommandNI2 = { bg = palette.maharaja, fg = palette.rose_laffy_taffy },
    SLModePendingNI1 = { bg = base.bg, fg = palette.majestic_magic },
    SLModePendingNI2 = { bg = palette.maharaja, fg = palette.majestic_magic },
    SLGitNI = { bg = '#000000', fg = palette.maharaja },
    SLFilenameNI = { bg = '#000000', fg = palette.celestial },
  }

  local hi = {
    SLModeNormal = { bg = palette.majestic_magic, fg = palette.enchanted_lilac },
    SLModeInsert = { bg = palette.saltwater_denim, fg = palette.pacific_blue },
    SLModeVisual = { bg = palette.purple_haze, fg = palette.mauve },
    SLModeReplace = { bg = palette.majestic_magic, fg = palette.violet_velvet },
    SLModeCommand = { bg = palette.rose_laffy_taffy, fg = palette.stellar_strawberry },
    SLModePending = { bg = palette.majestic_magic, fg = palette.enchanted_lilac },
    SLGit = { bg = palette.maharaja, fg = palette.enchanted_lilac },
    SLFilename = { bg = base.bg, fg = palette.majestic_magic },
    SLRecording = { bg = '#000000', fg = palette.grapefruit },
  }

  for hl_g, hl_o in pairs(hi_nerd_icons) do
    vim.api.nvim_set_hl(0, hl_g, hl_o)
  end

  for hl_g, hl_o in pairs(hi) do
    vim.api.nvim_set_hl(0, hl_g, hl_o)
  end
end

local function get_mode(has_gitsigns)
  local mode = modes[vim.fn.mode()]

  return table.concat {
    '%#SLMode' .. mode.hl .. '#',
    ' ',
    mode.name,
    ' ',
    '%#SLMode' .. mode.hl .. 'NI' .. (has_gitsigns == true and '2' or '1') .. '#',
    '',
  }
end

local function get_gitsigns()
  local head = vim.b.gitsigns_head
  if not head or head == '' then
    return ''
  end

  return table.concat {
    '%#SLGit#',
    ' ',
    '󰘬 ' .. head,
    ' ',
    '%#SLGitNI#',
    '',
    '%#StatusLine#',
  }
end

local function get_filepath()
  local filename = vim.fn.expand '%:.'
  if filename == '' then
    filename = '[No Name]'
  end

  return table.concat {
    '%#StatusLine#',
    ' ',
    filename,
  }
end

local function get_buffer_state()
  local modified = vim.bo.modified and ' ' or ''
  local readonly = (not vim.bo.modifiable or vim.bo.readonly) and ' ' or ''

  return table.concat {
    ' ',
    '%#SLFilenameNI#',
    modified,
    readonly,
    '%#StatusLine#',
  }
end

local function get_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return table.concat {
      ' ',
      '%#SLRecording#',
      ' ' .. recording_register,
      '%#StatusLine#',
    }
  end
end

-- Update the diagnostics in state f
local function get_diagnostics() end

local spinner_frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
local lsp_clients = {}

local function get_lsp_progrss()
  local parts = {}

  for _, c in pairs(lsp_clients) do
    local icon = spinner_frames[spinner_index]

    local text = string.format('%s %s %s (%d%%)', icon, c.title or '', c.msg or '', c.percent or 0)

    table.insert(parts, text)
  end

  if #parts == 0 then
    return ''
  end

  return ' %#SLGitText#  ' .. table.concat(parts, ' | ') .. ' %#StatusLine#'
end

local function get_file_type() end

local function setup()
  set_hls()

  -- Set the highlight groups if the colorscheme changes
  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = set_hls,
  })

  local status_line_group = vim.api.nvim_create_augroup('feketegy/statusline', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    pattern = { 'GitsignsAttach', 'GitsignsUpdate' },
    group = status_line_group,
    callback = function()
      vim.cmd 'redrawstatus'
    end,
  })

  vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
      local p = ev.data.params
      local client_id = ev.data.client_id
      local value = p.value

      if not client_id then
        return
      end

      lsp_clients[client_id] = lsp_clients[client_id] or {}

      local c = lsp_clients[client_id]

      if value.kind == 'begin' then
        c.title = value.title or ''
        c.msg = value.message or ''
        c.percent = value.percentage or 0
      elseif value.kind == 'report' then
        c.msg = value.message or c.msg
        c.percent = value.percentage or c.percent
      elseif value.kind == 'end' then
        lsp_clients[client_id] = nil
      end

      vim.cmd 'redrawstatus'
    end,
  })

  vim.o.statusline = '%{%v:lua.StatusLineRender()%}'
end

function _G.StatusLineRender()
  local git = get_gitsigns()
  local mode = get_mode(git ~= nil and git ~= '')

  return table.concat {
    mode,
    git,
    get_filepath(),
    get_buffer_state(),
    get_macro_recording(),
    '%=',
    get_lsp_progrss(),
  }
end

setup()

--
-- -- Show a little dot and the register char when recording a macro
--
-- function M.setup()
--   set_hls()
--
--   vim.api.nvim_create_autocmd('ColorScheme', {
--     group = vim.api.nvim_create_augroup('feketegy/statusline', {}),
--     desc = 'Apply statusline highlights on colorscheme change',
--     callback = set_hls,
--   })
--
--   -- Set the statusline
--   local status_line_group = vim.api.nvim_create_augroup('StatusLine', { clear = true })
--   vim.api.nvim_create_autocmd({ 'ModeChanged', 'BufEnter', 'BufWinEnter', 'BufWritePost', 'DiagnosticChanged', 'RecordingEnter', 'RecordingLeave' }, {
--     group = status_line_group,
--     pattern = '*',
--     callback = function()
--       vim.o.statusline = '%{%v:lua.StatusLine.render()%}'
--     end,
--   })
--
--   vim.api.nvim_create_autocmd('User', {
--     pattern = { 'GitsignsAttach', 'GitsignsUpdate' },
--     group = status_line_group,
--     callback = function()
--       vim.cmd 'redrawstatus'
--     end,
--   })
-- end
--
