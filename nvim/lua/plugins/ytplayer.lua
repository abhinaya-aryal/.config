return {
	-- "abhinaya-aryal/nvim-yt-player",
	dir = "~/projects/nvim-yt-player",
	name = "nvim-yt-player",
	event = "VeryLazy",
	config = function()
		require("yt-player").setup()
	end,
}
