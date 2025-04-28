-- local lsp = require('lsp-zero').preset({
--     name = 'recommended',
--     float_border = 'rounded',
--     call_servers = 'local',
--     configure_diagnostics = true,
--     setup_servers_on_start = true,
--     set_lsp_keymaps = {
--         preserve_mappings = false,
--         omit = {},
--     },
--     manage_nvim_cmp = {
--         set_sources = 'recommended',
--         set_basic_mappings = true,
--         set_extra_mappings = false,
--         use_luasnip = true,
--         set_format = true,
--         documentation_window = true,
--     },
-- })
--
-- -- Auto format on new buffer, this is synchronous and might block
-- lsp.on_attach(function(client, bufnr)
--     lsp.default_keymaps({ buffer = bufnr })
--     lsp.buffer_autoformat()
-- end)
--
-- -- Set 'gq' to format the current file
-- lsp.on_attach(function(client, bufnr)
--     lsp.default_keymaps({ buffer = bufnr })
--     local opts = { buffer = bufnr }
--
--     vim.keymap.set({ 'n', 'x' }, 'gq', function()
--         vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
--     end, opts)
-- end)
--
-- -- Attach navic breadcrumbs
-- lsp.on_attach(function(client, bufnr)
--     -- print("should attach navic")
--     if client.server_capabilities.documentSymbolProvider then
--         local navic = require("nvim-navic")
--         navic.attach(client, bufnr)
--     end
-- end)
--
-- -- In the "sign column" set symbols instead of letters
-- lsp.set_sign_icons({
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = '»'
-- })
--
-- -- Auto format on save for certain file types
-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['lua_ls'] = { 'lua' },
--         ['rust_analyzer'] = { 'rust' },
--         ['terraformls'] = { 'terraform' },
--         -- if you have a working setup with null-ls
--         -- you can specify filetypes it can format.
--         -- ['null-ls'] = {'javascript', 'typescript'},
--     }
-- })
--
-- -- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
-- lsp.setup()

vim.lsp.config['luals'] = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      }
    }
  }
}

vim.lsp.enable('luals')

vim.lsp.enable('gopls')

-- From primagen?!
-- https://lsp-zero.netlify.app/blog/theprimeagens-config-from-2022.html
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'F', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})
-- Autoformat on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--         buffer = buffer,
--         callback = function()
--             vim.lsp.buf.format { async = false }
--         end
--     })
