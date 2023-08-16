vim.g.mapleader = " "
-- File browser
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- -- Save
-- vim.keymap.set("n", "<C-s>", function() vim.api.nvim_command('update') end)

-- Format file based on lsp
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format)

-- Move window panes easily, now done with smart-splits
-- vim.keymap.set("n", "<C-h>", "<C-W>h")
-- vim.keymap.set("n", "<C-j>", "<C-W>j")
-- vim.keymap.set("n", "<C-k>", "<C-W>k")
-- vim.keymap.set("n", "<C-l>", "<C-W>l")
