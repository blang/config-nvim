return {
	{ -- Autoformat
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
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
		},
		keys = {
			{
				"-",
				function()
					require("oil").open_float()
				end,
				mode = "n",
				desc = "Open Oil",
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
