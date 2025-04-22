-- Helper to scroll past the last line, it uses the scrolloff option
-- to determine how many lines scroll past the lasst line.
return {
  'Aasim-A/scrollEOF.nvim',
  event = { 'CursorMoved', 'WinScrolled' },
  opts = {},
}
