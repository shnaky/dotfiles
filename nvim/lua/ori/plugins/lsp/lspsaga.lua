-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		border = "rounded",
		code_action = "",
		colors = {
			normal_bg = "#022746",
		},
	},
	-- winbar that shows tags under bufferline
	-- small color bug when shown
	symbol_in_winbar = {
		enable = false,
	},
})
