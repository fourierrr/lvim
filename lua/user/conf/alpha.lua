-- this is a lvim core plugin

local dashboard = lvim.builtin.alpha.dashboard
-- draw by https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=Alibaba
local art = {
	"                                                    ",
	" █████╗ ██╗     ██╗██████╗  █████╗ ██████╗  █████╗  ",
	"██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗ ",
	"███████║██║     ██║██████╔╝███████║██████╔╝███████║ ",
	"██╔══██║██║     ██║██╔══██╗██╔══██║██╔══██╗██╔══██║ ",
	"██║  ██║███████╗██║██████╔╝██║  ██║██████╔╝██║  ██║ ",
	"╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝ ",
	"                                                    ",
}

local headers = {
	type = "text",
	val = art,
	opts = {
		position = "center",
		hl = "Constant",
	},
}

local plugins = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
	local handle = io.popen('ls  $HOME"/.local/share/lunarvim/site/pack/lazy/opt/" | wc -l ')
	plugins = handle:read("*a")
	handle:close()

	plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
	plugins = "N/A"
end

local version = vim.version()
local print_version

if version then
	print_version = string.format("v%d.%d.%d", version.major, version.minor, version.patch)
else
	print_version = "unknown"
end

-- local pluginCount = {
--     type = "text",
--     val = "Neovim " .. print_version .. "    " .. plugins .. " plugins in total.",
--     opts = {
--         position = "center",
--         hl = "String",
--     },
-- }

local pluginCount = {
	type = "text",
	val = string.format("Neovim %s  %d plugins in total.", print_version, plugins),
	opts = {
		position = "center",
		hl = "String",
	},
}

local function button(usr_opts, txt, keybind, keybind_opts)
	local leader = "<LD>"
	local sc_after = usr_opts.shortcut:gsub("%s", ""):gsub(leader, "<leader>")

	local default_opts = {
		position = "center",
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Constant",
	}
	local opts = vim.tbl_deep_extend("force", default_opts, usr_opts)

	if nil == keybind then
		keybind = sc_after
	end
	keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
	opts.keymap = { "n", sc_after, keybind, keybind_opts }

	local function on_press()
		-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
		local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		-- { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 2 },
		-- dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		-- button({ shortcut = 'f', hl = { { 'DevIconC', 2, 3 } } }, "  Find file", ":Telescope find_files <CR>"),
		button({ shortcut = "f", hl = { { "Keyword", 2, 3 } } }, "  Find file", ":Telescope find_files <CR>"),
		{ type = "padding", val = 2 },
		-- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		-- button({ shortcut = 'e', hl = { { 'DevIconD', 2, 3 } } }, "  New file", ":ene <BAR> startinsert <CR>"),
		button({ shortcut = "e", hl = { { "Constant", 2, 3 } } }, "  New file", ":ene <BAR> startinsert <CR>"),
		{ type = "padding", val = 2 },
		-- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
		-- button({ shortcut = 'p', hl = { { 'DevIconGo', 2, 3 } } }, "  Find project", ":Telescope projects <CR>"),
		button({ shortcut = "p", hl = { { "Function", 2, 3 } } }, "  Find project", ":Telescope projects <CR>"),
		{ type = "padding", val = 2 },
		-- button({ shortcut = 'o', hl = { { 'DevIconHtm', 2, 3 } } }, "  Recently used files", ":Telescope oldfiles <CR>"),
		button(
			{ shortcut = "o", hl = { { "WarningMsg", 2, 3 } } },
			"  Recently used files",
			":Telescope oldfiles <CR>"
		),
		{ type = "padding", val = 2 },
		-- button({ shortcut = 't', hl = { { 'DevIconDb', 2, 3 } } }, "  Find text", ":Telescope live_grep <CR>"),
		button({ shortcut = "t", hl = { { "method", 2, 3 } } }, "  Find text", ":Telescope live_grep <CR>"),
		{ type = "padding", val = 2 },
		button(
			{ shortcut = "c", hl = { { "type", 2, 3 } } },
			"  Configuration",
			":e ~/.config/lvim/config.lua <CR>"
		),
		{ type = "padding", val = 2 },
		button({ shortcut = "l", hl = { { "character", 2, 3 } } }, "  Plugin Borad", ":Lazy <CR>"),
		{ type = "padding", val = 2 },
		-- dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		button({ shortcut = "q", hl = { { "Error", 2, 3 } } }, "  Quit Neovim", ":qa<CR>"),
		{ type = "padding", val = 2 },
		{ type = "padding", val = 2 },
		{
			type = "text",
			val = "--- 人算不如天算，天算就是云计算😎 ---",
			opts = { position = "center", hl = "Constant" },
		},
	},
	position = "center",
}

-- local buttons = {
--   opts = {
--     hl_shortcut = "Include",
--     spacing = 1,
--   },
--   entries = {
--     { "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
--     { "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
--     { "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
--     { "o", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
--     { "t", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>" },
--     {
--       "c",
--       lvim.icons.ui.Gear .. "  Configuration",
--       "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
--     },
--     { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
--   },
-- }

local function footer()
	-- NOTE: requires the fortune-mod package to work
	local datetime = os.date("%Y/%m/%d %H:%M:%S")
	return datetime
end

local foot = {
	type = "text",
	val = footer(),
	opts = {
		position = "center",
		hl = "String",
	},
}

-- local alpha = lvim.builtin.alpha

dashboard.config.layout = {
	{ type = "padding", val = 5 },
	headers,
	{ type = "padding", val = 5 },
	pluginCount,
	{ type = "padding", val = 5 },
	buttons,
	{ type = "padding", val = 5 },
	foot,
}

-- lvim.builtin.alpha.dashboard.section.buttons = buttons
-- lvim.builtin.alpha.dashboard.section.header = headers
-- lvim.builtin.alpha.dashboard.section.footer = foot

-- lvim.builtin.alpha.dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
-- alpha.setup = dashboard.opts
