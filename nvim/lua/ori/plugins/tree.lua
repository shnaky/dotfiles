-- import settings file with protected call
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.nvim_tree_auto_close = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- tree config setup
nvimtree.setup({
	-- windows / buffer setup
	view = {
		-- floating window
		float = {
			enable = true,
			quit_on_focus_loss = true, -- close tree when out of focus
		},
	},
	renderer = {
		group_empty = true, -- empty folders shown as one
	},
})
