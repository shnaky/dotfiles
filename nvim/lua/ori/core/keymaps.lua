vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>w", ":w!<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- move over soft-wrapped line
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- insert line
keymap.set("n", "o", "o<ESC>")
keymap.set("n", "O", "O<ESC>")

-- delete
keymap.set("n", "d", '"_d') -- put delete in black hole register
keymap.set("v", "d", '"_d')

-- windows
keymap.set("n", "<leader>vs", "<C-w>v") -- vertical split
keymap.set("n", "<leader>vh", "<C-w>s") -- horizontal split

-- navigate windows
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- barbar
-- Move to previous/next
keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>")
-- Re-order to previous/next
keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Close buffer
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")
