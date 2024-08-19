local cs_files = {}
cs_files[1] = (os.getenv("FSRC_CS"))
cs_files[2] = (os.getenv("BCCB_CS"))
cs_files[3] = (os.getenv("DFOS_CS"))
cs_files[4] = (os.getenv("CGI_CS"))
cs_files[5] = "./cscope.out"
return {
	{
		"dhananjaylatkar/cscope_maps.nvim",
		dependencies = {
			"folke/which-key.nvim", -- optional [for whichkey hints]
			"nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
			"ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
			"nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope or fzf]
		},
    lazy = false,
		config = function()
			require("cscope_maps").setup({
				cscope = {
					db_file = cs_files,
					picker = "telescope",
					qf_window_size = 10,
					-- USE EMPTY FOR DEFAULT OPTIONS
					-- DEFAULTS ARE LISTED BELOW
				}
			})
		end,
	},
}
