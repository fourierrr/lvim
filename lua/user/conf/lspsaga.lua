local lspsaga = require("lspsaga")
lspsaga.setup({ -- defaults ...
	debug = false,
	use_saga_diagnostic_sign = false,
	-- diagnostic sign
	error_sign = lvim.icons.diagnostics.Error,
	warn_sign = lvim.icons.diagnostics.Warning,
	hint_sign = lvim.icons.diagnostics.Hint,
	infor_sign = "",
	diagnostic_header_icon = "   ",
	-- code action title icon
	code_action_icon = lvim.icons.ui.Lightbulb,
	code_action_prompt = {
		enable = true,
		sign = false,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		quit = "q",
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
	},
	code_action_keys = {
		-- quit = "q",
		quit = "<C-c>",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<C-c>",
		exec = "<CR>",
	},
	definition_preview_icon = lvim.icons.kind.Event,
	border_style = "single",
	rename_prompt_prefix = "Rename ➤",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = false,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = true,
})
