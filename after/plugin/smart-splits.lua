require('smart-splits').setup({
    resize_mode = {
        silent = true,
        hooks = {
            on_leave = require('bufresize').register,
        },
    },
})

-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = "Move left" })
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = "Move down" })
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = "Move up" })
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = "Move right" })

-- swapping buffers between windows
vim.keymap.set('n', '<leader>sh', function() require('smart-splits').swap_buf_left({ move_cursor = true }) end,
    { desc = "Swap left" })
vim.keymap.set('n', '<leader>sj', function() require('smart-splits').swap_buf_down({ move_cursor = true }) end,
    { desc = "Swap down" })
vim.keymap.set('n', '<leader>sk', function() require('smart-splits').swap_buf_up({ move_cursor = true }) end,
    { desc = "Swap up" })
vim.keymap.set('n', '<leader>sl', function() require('smart-splits').swap_buf_right({ move_cursor = true }) end,
    { desc = "Swap right" })

vim.keymap.set('n', '<leader>sr', function() require('smart-splits').start_resize_mode() end, { desc = "Resize Mode" })
