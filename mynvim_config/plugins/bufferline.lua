-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Adding some test code
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
print ("Vamsi: in bufferline")
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
}
