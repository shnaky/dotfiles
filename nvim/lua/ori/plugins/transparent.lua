-- TODO: add extra_groups and exclude to make it smooth
-- import nvim-transparent plugin safely
local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
	enable = false, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups
		"NvimTreeNormal",
	},
	exclude = {}, -- table: groups you don't want to clear
})
