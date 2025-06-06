require("lazy").setup({
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    -- No longer maintained
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v2.x',
    --     dependencies = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },             -- Required
    --         { 'williamboman/mason.nvim' },           -- Optional
    --         { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    --
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },     -- Required
    --         { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    --         { 'L3MON4D3/LuaSnip' },     -- Required
    --     }
    -- },
    -- Line below
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Color scheme
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                -- Your config here
            })
        end,
    },
    -- Commenting line based on treesitter
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    -- -- Telescope file browser plugin, replaced with oil
    -- {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", 'nvim-tree/nvim-web-devicons' }
    --
    -- },
    -- Terminal in vim
    { 'akinsho/toggleterm.nvim',             version = "*", config = true },
    -- Indent lines as guides
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
    -- Shows breadcrumbs on top of editor
    {
        "SmiteshP/nvim-navic",
        dependencies = { { "neovim/nvim-lspconfig" } },
    },
    -- Mark frequently used files
    {
        "theprimeagen/harpoon",
        dependencies = {
            {
                'nvim-lua/plenary.nvim',
            },
        },
    },
    -- Remember last position in files
    {
        'ethanholz/nvim-lastplace',
    },

    -- Smart window splits and proportional resize
    {
        'kwkarlwang/bufresize.nvim',
    },
    {
        'mrjones2014/smart-splits.nvim',
        dependencies = {
            {
                'kwkarlwang/bufresize.nvim',
            },
        },
    },
    -- Maximize window split
    {
        'declancm/maximize.nvim',
    },
    -- Lazygit nvim
    -- {
    --     "kdheepak/lazygit.nvim",
    --     -- optional for floating window border decoration
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },
    -- Telescope fzf native
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
            },
        },
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    -- File browser
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- Vim git
    {
        'tpope/vim-fugitive',
    },
    -- Go
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    -- Mason package manager for example to install lsps
    {
        "williamboman/mason.nvim"
    },
    {
      "williamboman/mason-lspconfig.nvim",
      },
      {
        "neovim/nvim-lspconfig",
    },

})
