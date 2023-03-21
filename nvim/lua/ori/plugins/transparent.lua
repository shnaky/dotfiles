-- TODO: add extra_groups and exclude to make it smooth
-- import nvim-transparent plugin safely
local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
	-- enable = false, -- enable has been removed!
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups
		"NvimTreeNormal",
	},
	exclude_groups = {}, -- table: groups you don't want to clear
})
