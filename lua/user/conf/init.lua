local ends_with = function(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end

local M = {}

-- 创建一个命令以触发该函数

M.setup = function()
	-- local config_dir = vim.fn.stdpath('config') .. '/lua/user/conf'
	local config_dir = "~/.config/lvim/lua/user/conf"
	-- plugins do not need to load, NOTE: no .lua suffix required
	local unload_plugins = {
		"init", -- we don't need to load init again
	}

	local helper_set = {}
	for _, v in pairs(unload_plugins) do
		helper_set[v] = true
	end
	local path = vim.fn.expand(config_dir)
	for _, fname in pairs(vim.fn.readdir(path)) do
		if ends_with(fname, ".lua") then
			local cut_suffix_fname = fname:sub(1, #fname - #".lua")
			if helper_set[cut_suffix_fname] == nil then
				local file = "user.conf." .. cut_suffix_fname
				local status_ok, _ = pcall(require, file)
				if not status_ok then
					vim.notify("Failed loading " .. fname, vim.log.levels.ERROR)
				end
			end
		end
	end
end

M.setup()
