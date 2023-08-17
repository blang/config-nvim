require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
    },
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 100,
        max_height = 50,
        border = "rounded",
        win_options = {
            winblend = 10,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
            return conf
        end,
    },
})
vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })
