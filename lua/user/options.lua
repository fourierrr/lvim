-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.cmdheight = 1
vim.opt.spelllang = "en"

-- set autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Disable automatic comment insertion",
	group = vim.api.nvim_create_augroup("AutoComment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
-- vim.opt.foldcolumn = '0'
-- vim.opt.foldenable = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99

--lvim options
lvim.log.level = "info"
lvim.format_on_save = { enabled = false }
-- lvim.format_on_save = {
--     enabled = true,
--     pattern = "*.lua",
--     timeout = 1000,
-- }

vim.cmd(
	[[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif ]]
)
