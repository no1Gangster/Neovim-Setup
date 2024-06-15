function ColorTerm(color)
	color = color or "carbonfox"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end


return {
	"EdenEast/nightfox.nvim" ,
	config = function()
		vim.cmd("colorscheme carbonfox")

		ColorTerm()
	end
}
