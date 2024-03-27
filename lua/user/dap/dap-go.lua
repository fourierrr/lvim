local dap = require("dap")

dap.adapters.go = function(callback, _)
	local stdout = vim.loop.new_pipe(false)
	local handle
	local pid_or_err
	local port = 38691
	local opts = {
		stdio = { nil, stdout },
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}

	handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print("dlv exited with code", code)
		end
	end)
	assert(handle, "Error running dlv: " .. tostring(pid_or_err))
	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
			end)
		end
	end)
	vim.defer_fn(function()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)
end

-- 此处获取命令行输入参数，其他语言的配置也是可以加的啦
-- 主要是这个程序是一个简单的容器实验，模仿实现docker所以需要从命令行输入参数
local get_args = function()
	-- 获取输入命令行参数
	local cmd_args = vim.fn.input("CommandLine Args:")
	local params = {}
	-- 定义分隔符(%s在lua内表示任何空白符号)
	for param in string.gmatch(cmd_args, "[^%s]+") do
		table.insert(params, param)
	end
	return params
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = "${file}",
		args = get_args,
	},
	{
		type = "go",
		name = "Debug Package",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = "${fileDirname}",
		args = get_args,
	},
	{
		type = "go",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		cwd = "${workspaceFolder}",
		args = get_args,
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		cwd = "${workspaceFolder}",
		args = get_args,
		program = "./${relativeFileDirname}",
	},
	{
		type = "go",
		name = "delve container debug",
		request = "attach",
		mode = "remote",
		substitutepath = { {
			from = "${workspaceFolder}",
			to = "/go",
		} },
	},
}

-- require('dap-go').setup {
--   -- Additional dap configurations can be added.
--   -- dap_configurations accepts a list of tables where each entry
--   -- represents a dap configuration. For more details do:
--   -- :help dap-configuration
--   dap_configurations = {
--     {
--       -- Must be "go" or it will be ignored by the plugin
--       type = "go",
--       name = "Attach remote",
--       mode = "remote",
--       request = "attach",
--     },
--   },
--   -- delve configurations
--   delve = {
--     -- the path to the executable dlv which will be used for debugging.
--     -- by default, this is the "dlv" executable on your PATH.
--     path = "dlv",
--     -- time to wait for delve to initialize the debug session.
--     -- default to 20 seconds
--     initialize_timeout_sec = 20,
--     -- a string that defines the port to start delve debugger.
--     -- default to string "${port}" which instructs nvim-dap
--     -- to start the process in a random available port
--     -- port = "${port}",
--     port = "38697",
--     -- additional args to pass to dlv
--     args = {},
--     -- the build flags that are passed to delve.
--     -- defaults to empty string, but can be used to provide flags
--     -- such as "-tags=unit" to make sure the test suite is
--     -- compiled during debugging, for example.
--     -- passing build flags using args is ineffective, as those are
--     -- ignored by delve in dap mode.
--     build_flags = "",
--   },
-- }
