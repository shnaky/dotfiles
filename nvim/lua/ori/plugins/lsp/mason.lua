-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

-- configure mason-lspconfig to configure lsp-servers
mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {

		"pyright",

		-- essential
		"lua_ls",
		"jsonls",
		"marksman",

		-- WebDev
		"html",
		"cssls",
		"tsserver", -- ts/js
		"emmet_ls", -- WebDev tool
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

-- configure mason-null-ls to configure fromatters & linters
mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- "luacheck", -- lua linter (needs luarocks)
		"stylua", -- lua formatter
		"flake8", -- python linter
		"black", -- python formatter

		-- WebDev
		"eslint_d", -- ts/js linter
		"prettier", -- ts/js formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
