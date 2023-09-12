local dap = require('dap')
-- local dap_utils = require "user.plugins.configs.dap.utils"
local MASON_BIN_PATH = "/root/.local/share/lvim/mason/bin"
local MASON_PACKAGE_PATH = "/root/.local/share/lvim/mason/packages"
local BASH_DEBUG_ADAPTER_BIN = MASON_BIN_PATH .. "/bash-debug-adapter"
local BASHDB_DIR = MASON_PACKAGE_PATH .. "/bash-debug-adapter/extension/bashdb_dir"

dap.adapters.sh = {
  type = "executable",
  command = BASH_DEBUG_ADAPTER_BIN,
}

dap.configurations.sh = {
  {
    name = "Launch Bash debugger",
    type = "sh",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    pathBashdb = BASHDB_DIR .. "/bashdb",
    pathBashdbLib = BASHDB_DIR,
    pathBash = "bash",
    pathCat = "cat",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    env = {},
    args = {},
    -- showDebugOutput = true,
    -- trace = true,
  }
}
