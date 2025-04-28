print("Go file sourced")
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        print("Go format")
        require('go.format').goimports()
    end,
    group = format_sync_grp,
})
require('go').setup()
