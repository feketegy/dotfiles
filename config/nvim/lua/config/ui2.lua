require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "cmd",
			empty = "cmd",
			bufwrite = "cmd",
			echo = "msg",
			echomsg = "msg",
			shell_ret = "msg",
			undo = "msg",
			wmsg = "msg",
			completion = "msg",
			confirm = "dialog",
			confirm_sub = "dialog",
			echoerr = "msg",
			emsg = "msg",
			list_cmd = "pager",
			lua_error = "msg",
			lua_print = "msg",
			progress = "msg",
			quickfix = "msg",
			rpc_error = "msg",
			search_cmd = "msg",
			search_count = "msg",
			shell_cmd = "msg",
			shell_err = "msg",
			shell_out = "msg",
			typed_cmd = "msg",
			verbose = "pager",
			wildlist = "msg",
		},
		cmd = {
			height = 0.5,
		},
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.3,
			timeout = 5000,
		},
		pager = {
			height = 0.5,
		},
	},
})

local skip_messages = {
	-- Write
	"%d+L, %d+B",

	-- Search
	"; after #%d+",
	"; before #%d+",
	"^[/?].*", -- searching up/down
	"E486: Pattern not found:",

	-- Edit
	"%d+ less lines",
	"%d+ fewer lines",
	"%d+ more lines",
	"%d+ change;",
	"%d+ line less;",
	"%d+ more lines?;",
	"%d+ fewer lines;?",
	"1 more line",
	"1 line less",
	"^Hunk %d+ of %d+$",
	"Already at newest change",
	"Already at oldest change",

	"%d lines yanked",
	"no lines in buffer",

	-- Undo/Redo
	"%d+ changes?;",
	" changes; brefore #",
	" changes; after #",
	" 1 change; before #",
	" 1 change; after #",

	-- Move lines
	" lines moved",
	" lines indented",
}

local normalized_content = function(src)
	if type(src) ~= "table" then
		return tostring(src or "")
	end

	local list = {}
	for _, chunk in ipairs(src) do
		if type(chunk) == "table" and chunk[2] then
			list[#list + 1] = chunk[2]
		end
	end

	return table.concat(list)
end

local messages = require("vim._core.ui2.messages")
local o_msg_show = messages.msg_show

messages.msg_show = function(kind, content, replace_last, history, append, id, trigger)
	if kind == "bufwrite" then
		return
	end

	local msg = normalized_content(content)

	for _, pat in ipairs(skip_messages) do
		if msg:find(pat) then
			return
		end
	end

	o_msg_show(kind, content, replace_last, history, append, id, trigger)
end
