-- protected call (pcall) if case colorscheme is not found
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!")
	return
end
