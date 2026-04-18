-- Keymap helpers

local M = {}

---@param keys string The keys to map
---@param func string|fun():nil The command string or the function to execute
---@param desc? string Optional description
---@param mode? string|table Optional mode(s), default is normal mode
---@param buf? integer Optional buffer
---@param silent? boolean Optional silent flag
function M.map(keys, func, desc, mode, buf, silent)
	mode = mode or "n"

	local opts = {
		desc = desc or "",
	}

	if type(buf) == "number" then
		opts.buf = buf
	end

	if silent == true then
		opts.silent = true
	end

	vim.keymap.set(mode, keys, func, opts)
end

return M
