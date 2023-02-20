-- import lspconfig plugin safely
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
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  -- diagnostic mappings
  keymap.set('n', '<space>d', vim.diagnostic.open_float, bufopts)
  keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
end

-- used to enable autocompletion with cmp-nvim-lsp instead of nvims "omnifunc"
local capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- configure lua server (with Server-specific settings)
lspconfig['lua_ls'].setup{
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
}

-- configure python server
lspconfig['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

