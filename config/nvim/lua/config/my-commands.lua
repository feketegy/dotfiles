-- Custom autocommands, usercommands, etc

local cmd = vim.api.nvim_create_autocmd
local my_commands = vim.api.nvim_create_augroup('my-commands', { clear = true })

cmd('TextYankPost', {
  desc = 'Highlight text when yanking in normal mode',
  group = my_commands,
  callback = function()
    vim.hl.on_yank {
      timeout = 60,
      on_visual = false,
      higroup = 'Visual',
    }
  end,
})

cmd('FileType', {
  desc = 'Remove a line from the quickfix list by using dd',
  group = my_commands,
  pattern = 'qf',
  callback = function(event)
    local bufmap = require('config.utils').bufmap

    bufmap('dd', function()
      local qflist = vim.fn.getqflist()
      if #qflist == 0 then
        return
      end

      local line = vim.fn.line '.'
      table.remove(qflist, line)
      vim.fn.setqflist({}, ' ', { items = qflist })

      local new_count = #qflist
      if new_count > 0 then
        local new_line = math.min(line, new_count)
        vim.api.nvim_win_set_cursor(0, { new_line, 0 })
      end
    end, 'Delete line in the quickfix list', event.buf, 'n')
  end,
})
