local status , nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.html.setup{
  capabilities = capabilities 
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always",
  },
})
