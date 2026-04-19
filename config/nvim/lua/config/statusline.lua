local M = {}

local function set_hls()
  local base = vim.api.nvim_get_hl(0, {
    name = 'StatusLine',
    link = false,
    create = false,
  })

  local hi = {
    SLModeNormalIcon = { bg = base.bg, fg = '#544e72' },
    SLModeNormalText = { bg = '#544e72', fg = '#a5a1b9' },
    SLModeInsertIcon = { bg = base.bg, fg = '#2b5d75' },
    SLModeInsertText = { bg = '#2b5d75', fg = '#52a3be' },
    SLModeVisualIcon = { bg = base.bg, fg = '#84729b' },
    SLModeVisualText = { bg = '#84729b', fg = '#d3b2f5' },
    SLModeReplaceIcon = { bg = base.bg, fg = '#b099cd' },
    SLModeReplaceText = { bg = '#544e72', fg = '#b099cd' },
    SLModeCommandIcon = { bg = base.bg, fg = '#984960' },
    SLModeCommandText = { bg = '#984960', fg = '#eb7193' },
    SLModePendingIcon = { bg = base.bg, fg = '#544e72' },
    SLModePendingText = { bg = '#544e72', fg = '#a5a1b9' },
    SLGitIcon = { bg = base.bg, fg = '#3f3a56' },
    SLGitText = { bg = '#3f3a56', fg = '#a5a1b9' },
    SLFilenameText = { bg = base.bg, fg = '#5a576e' },
    SLFilenameIcon = { bg = base.bg, fg = '#12708f' },
    SLRecordingText = { bg = base.bg, fg = '#FF6666' },
  }

  for grp, opts in pairs(hi) do
    vim.api.nvim_set_hl(0, grp, opts)
    vim.api.nvim_set_hl(0, grp .. 'Inverted', { bg = opts.fg, fg = opts.bg })
  end
end

function M.set_colors()
  set_hls()

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('feketegy/statusline', {}),
    desc = 'Apply statusline highlights on colorscheme change',
    callback = set_hls,
  })
end

function M.block_mode()
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

  local mode = modes[vim.fn.mode()]

  local ret = table.concat {
    '%#SLMode' .. mode.hl .. 'Text# ' .. mode.name .. ' ',
    '%#SLMode' .. mode.hl .. 'Icon#',
    '%#StatusLine#',
  }

  return ret
end

function M.block_git()
  local head = vim.b.gitsigns_head
  if not head or head == '' then
    return ''
  end

  local ret = table.concat {
    '%#SLGitIcon#',
    '%#SLGitText#  ' .. head .. ' ',
    '%#SLGitIcon#%#StatusLine#',
  }

  return ret
end

-- Separate the filename and symbols into different highlight groups
function M.block_filename_with_symbols()
  local filename = vim.fn.expand '%:.'

  if filename == '' then
    filename = '[No Name]'
  end

  local modified = vim.bo.modified and ' ' or ''
  local readonly = (not vim.bo.modifiable or vim.bo.readonly) and ' ' or ''

  -- Apply highlights manually
  local fname_hl = '%#SLFilenameText#'
  local symbol_hl = '%#SLFilenameIcon#'

  return table.concat {
    fname_hl,
    ' ',
    filename,
    ' ',
    symbol_hl,
    modified,
    readonly,
    '%#StatusLine#',
    ' ',
  }
end

-- Show a little dot and the register char when recording a macro
function M.show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return table.concat {
      '%#SLRecordingText#',
      ' ' .. recording_register,
      '%#StatusLine#',
    }
  end
end

function M.render()
  M.set_colors()

  return table.concat {
    M.block_mode(),
    M.block_git(),
    M.block_filename_with_symbols(),
    M.show_macro_recording(),
    '%=',
    'Status right',
  }
end

-- export globally
_G.StatusLine = M

-- Set the statusline
local status_line_group = vim.api.nvim_create_augroup('StatusLine', { clear = true })
vim.api.nvim_create_autocmd({ 'ModeChanged', 'BufEnter', 'BufWinEnter', 'BufWritePost', 'DiagnosticChanged', 'RecordingEnter', 'RecordingLeave' }, {
  group = status_line_group,
  pattern = '*',
  callback = function()
    vim.o.statusline = '%{%v:lua.StatusLine.render()%}'
  end,
})
