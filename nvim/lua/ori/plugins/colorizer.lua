-- import nvim-colorizer plugin safely
local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	-- on all filetypes
	filetypes = { "*" },
	user_default_options = {
		-- ignore names like "blue"
		names = false,
	},
})
