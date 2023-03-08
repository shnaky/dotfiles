vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>w", ":w!<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<C-a>", "gg<S-v>G") -- select all

-- visual mode
keymap.set("x", "v", "<ESC>")

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

-- buffers
keymap.set("n", "<leader>bb", ":bd<CR>") -- bye bye buffer

-- navigate windows
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- Resize windows
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")
keymap.set("n", "<C-left>", "<C-w>>")
keymap.set("n", "<C-right>", "<C-w><")

-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- bufferline
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
