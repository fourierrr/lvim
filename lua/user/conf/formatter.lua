local status_ok, formatters = pcall(require, "formatter")
if not status_ok then
	vim.notify("formatter not found!")
	return
end

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatters.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		go = {
			require("formatter.filetypes.go").goimports,
		},

		json = {
			require("formatter.filetypes.json").jq,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		yml = {
			require("formatter.filetypes.yaml").yamlfmt,
		},

		yaml = {
			require("formatter.filetypes.yaml").yamlfmt,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
