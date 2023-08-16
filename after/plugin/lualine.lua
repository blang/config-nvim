local navic = require("nvim-navic")
require('lualine').setup({
    options = {
        theme = "everforest",
    },
    -- sections = {
    --     lualine_c = {
    --         {
    --             function()
    --                 return navic.get_location()
    --             end,
    --             cond = function()
    --                 return navic.is_available()
    --             end
    --         },
    --     }
    -- },
    -- OR in winbar
    -- navic breadcrumbs
    winbar = {
        lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            },
        }
    }
})
