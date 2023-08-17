local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end)
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "git files" })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "help tags [telescope]" })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "files [telescope]" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "grep [telescope]" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers [telescope]" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "helm tags [telescope]" })

local actions = require('telescope.actions')

require("telescope").setup {
    -- defaults = {
    --     layout_strategy = 'vertical',
    --     layout_config = { height = 0.95 },
    -- },
    defaults = {
        mappings = {
            ["i"] = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    -- defaults = vim.tbl_extend(
    --     "force",
    --     require('telescope.themes').get_cursor(), -- or get_cursor, get_ivy
    --     {
    --         --- your own `default` options go here, e.g.:
    --         path_display = {
    --             truncate = 2
    --         },
    --         mappings = {
    --             i = {
    --                 ["<esc>"] = actions.close,
    --             },
    --         }
    --     }
    -- ),
    -- defaults = {
    --     theme = "ivy",
    --     mappings = {
    --         ["i"] = {
    --             ["<C-j>"] = builtin.move_selection_next,
    --             ["<C-k>"] = builtin.move_selection_previous,
    --         },
    --     },
    -- },
    pickers = {
        find_files = {
            -- theme = "ivy"
            -- theme = "cursor"
        },
    },
    extensions = {
        -- file_browser = {
        --     theme = "ivy",
        --     -- disables netrw and use telescope-file-browser in its place
        --     hijack_netrw = true,
        --     mappings = {
        --         --   ["i"] = {
        --         --     -- your custom insert mode mappings
        --         --   },
        --         --   ["n"] = {
        --         --     -- your custom normal mode mappings
        --         --   },
        --         -- ["i"] = {
        --         --     ["<C-j>"] = builtin.move_selection_next,
        --         --     ["<C-k>"] = builtin.move_selection_previous,
        --         -- },
        --     },
        -- },
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
}
-- require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"

-- vim.api.nvim_set_keymap(
--     "n",
--     "<leader>pv",
--     ":Telescope file_browser path=%:p:h select_buffer=true depth=4<CR>",
--     { desc = "file browser [telescope]", noremap = true }
-- )
-- local fb= require("telescope").extensions.file_browser
-- vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = "filebrowser [telescope]" })
