return {
	{
		"theprimeagen/harpoon",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
		end,
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon.mark").add_file()
				end,
				mode = "n",
				desc = "Add file to harpoon",
			},
			{
				"<leader>e",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				mode = "n",
				desc = "Open harpoon menu",
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
