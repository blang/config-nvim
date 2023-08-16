require('maximize').setup({
    default_keymaps = false
})
vim.keymap.set('n', '<leader>sf', "<Cmd>lua require('maximize').toggle()<CR>", { desc = "Toggle Maximize [Win]" })
