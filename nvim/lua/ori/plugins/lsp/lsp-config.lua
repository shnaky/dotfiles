-- import lspconfig plugin s_set_paramsafely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local keymap = vim.keymap
	-- Mappings.
	-- use Lspsaga for UI
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", bufopts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", bufopts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", bufopts) -- see outline on right hand side
end

-- used to enable autocompletion with cmp-nvim-lsp instead of nvims "omnifunc"
local capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- configure lua server (with Server-specific settings)
lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure python server
lspconfig["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

-- WebDev

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	flags = lsp_flags,
	on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	flags = lsp_flags,
	on_attach = on_attach,
})

-- configure tsserver server
lspconfig["tsserver"].setup({
	capabilities = capabilities,
	flags = lsp_flags,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	flags = lsp_flags,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})
