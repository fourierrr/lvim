-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
-- add your own keymapping
-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

lvim.leader = "space"
-- <M-...> is meta key, is opts in Mac,  need to config in iterm2, Preference -> Profiles -> Keys -> Left Option key -> ESC+.
local mappings = {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<M-w>"] = { function() closeWindowOrBuffer() end, desc = "Close current window/split" },
    -- ["<M-q>"] = { "<cmd>qa!<CR>", desc = "quit nvim" },

    -- ["<leader>df"] = { "<cmd> DiffviewOpen <cr>", desc = "Open diffview" },
    -- ["<leader>dd"] = { "<cmd> DiffviewFileHistory %<cr>", desc = "diff current file" },
    -- ["<leader>dv"] = { ":call v:lua.compare_to_clipboard()<CR>", desc = "Diff selected with clipboard" },
    ["<leader>j"] = { ":HopWord<cr>", desc = "Hop jump word" },
    ["T"] = { ":ToggleTerm<cr>", desc = "Toggle terminal" },
    ["tt"] = { ":SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
    ["<leader>a"] = { ":Lspsaga code_action<cr>", desc = "Lspsaga code_action" },
    ["<leader>rn"] = { ":Lspsaga rename<cr>", desc = "Lspsaga rename" },

    ["<c-d>"] = { "15j", desc = "faster j" },
    ["<c-u>"] = { "15k", desc = "faster j" },


    ["fm"] = { "<cmd>lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },
    -- ["<M-m>"] = { "<cmd>lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },

    -- ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },

    -- Run
    -- ["<leader>rr"] = { "<cmd>GoTestFile<cr>", desc = "GoTestFile" },
    -- ["<leader>rt"] = { "<cmd>GoTest<cr>", desc = "RunAllGoTest: GoTestFile" },
    ["<M-r>"] = { ":%SnipRun<CR>", desc = "Run current file" },

    -- ["<leader>zo"] = { "zR", desc = "Unfold all" },
    -- ["<leader>zc"] = { "zM", desc = "Fold all" },
    ["<leader>1"] = { ":BufferLineGoToBuffer 1<cr>", desc = "go to buffer 1" },
    ["<leader>2"] = { ":BufferLineGoToBuffer 2<cr>", desc = "go to buffer 1" },
    ["<leader>3"] = { ":BufferLineGoToBuffer 3<cr>", desc = "go to buffer 1" },
    ["<leader>4"] = { ":BufferLineGoToBuffer 4<cr>", desc = "go to buffer 1" },
    ["<leader>5"] = { ":BufferLineGoToBuffer 5<cr>", desc = "go to buffer 1" },
    ["<leader>6"] = { ":BufferLineGoToBuffer 6<cr>", desc = "go to buffer 1" },

    -- dap
    ["<F9>"] = { "<cmd>lua require'dap'.run_last()<cr>" },
    ["<F4>"] = { "<cmd>lua require'dap'.terminate()<cr>" },
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>" },
    ["<F6>"] = { "<cmd>lua require'dap'.step_over()<cr>" },
    ["<F7>"] = { "<cmd>lua require'dap'.step_into()<cr>" },
    ["<F8>"] = { "<cmd>lua require'dap'.step_out()<cr>" },

    -- Nohl
    -- ["<leader>nl"] = { "<cmd> nohl <CR>", desc = "nohl" },

    -- Show
    -- ["<leader>ss"] = { "<cmd>AerialToggle<CR>", desc = "Show outline" },

    -- ["<C-q>"] = { "<cmd>SessionManager load_session<CR>", desc = "Load session" }, -- <!>load_session

    -- Test KeyStroke
    ["<C-M-m>"] = { '<cmd>lua vim.notify("heihei")<CR>' }, -- command+control+m
    -- ["<M-m>"] = { '<cmd>lua vim.notify("<M> is CMD in Mac, achieve by wezterm")<CR>' }, -- command+m
    -- ["<M-I>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }, -- alt + shift + i --> tab + i --> by karabiner


    -- ["<leader>db"] = {
    --   "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>",
    -- },
    -- ["<leader>dt"] = {"<CMD>GoDebug -t<CR>"},
    -- ["<M-F8>"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>" }, -- command+f8
    -- ["<F4>"] = { "<cmd>lua require'dap'.terminate()<CR>" },
    -- ["<F9>"] = { "<cmd>lua require'dap'.continue()<CR>" },
    -- ["<F7>"] = { "<cmd>lua require'dap'.step_into()<CR>" },
    -- ["<F8>"] = { "<cmd>lua require'dap'.step_over()<CR>" },
  },
  i = {
    -- ["<C-q>"] = { "<cmd>SessionManager load_session<CR>", desc = "Load session" }, -- <!>load_session
    ["jk"] = { "<Esc>", desc = "back to normal_mode" },
    ["<M-P>"] = { "<cmd>Telescope commands<CR>", desc = "Find commands" },

    [";;"] = { " := ", desc = "golang: assign value" },
    -- [";a"] = { " != ", desc = "!=" },
    -- [";s"] = { " += ", desc = "+=" },
    -- [";d"] = { " == ", desc = "==" },
    -- ["<C-i>"] = { 'copilot#Accept("<CR>")', desc = "copilot Accept" },
  },
  v = {
    ["<leader>dd"] = { "<cmd> DiffviewFileHistory<cr>", desc = "Diff file history" },
    ["<M-r>"] = { "<Plug>SnipRun" },
    -- ["<M-k>"] = { "<CMD>Lspsaga code_action<CR>", desc = "Code Action" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

local function SnipRun()
  lvim.keys.visual_mode["<leader>rr"] = { "<Plug>SnipRun" }
  lvim.keys.normal_mode["<leader>rr"] = { "<Plug>SnipRunOperator" }
end

local function explorer()
  lvim.keys.normal_mode["ff"] = "<cmd>NvimTreeToggle<cr>"
  -- lvim.keys.normal_mode["<leader>fl"] = "<cmd>NvimTreeFocus<cr>" -- find location
end

local function telescopeMappings()
  lvim.keys.normal_mode["<leader>o"] = { "<cmd>Telescope oldfiles<cr>" }
  lvim.keys.normal_mode["<leader>f"] = { "<cmd>Telescope find_files <CR>" }
  -- lvim.keys.normal_mode["<leader>g"] = { "<cmd>Telescope live_grep<cr>" }
  lvim.keys.normal_mode["<leader>t"] = { "<cmd>Telescope live_grep<cr>" }
end

local function lspMappings()
  lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>" }
  lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<CMD>Telescope lsp_definitions<CR>" }
  lvim.lsp.buffer_mappings.normal_mode["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>" }
  lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<CMD>Telescope lsp_implementations<CR>" }
  lvim.lsp.buffer_mappings.normal_mode["ge"] = { "<CMD>Telescope diagnostics<CR>" }
  lvim.lsp.buffer_mappings.normal_mode["gE"] = {
    "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line', border = 'rounded' })<CR>" }

  lvim.lsp.buffer_mappings.normal_mode['gh'] = lvim.lsp.buffer_mappings.normal_mode['K']
end

local function whichkey()
  -- default <leader>f is choose find_files or git_files
  -- i do not want git_files, it's will always be find_files
  lvim.builtin.which_key.mappings["f"] = {}
  lvim.builtin.which_key.mappings["b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" }
end

function Setup()
  -- unmapLvimDefault()
  -- bufferLineKeybindings()
  explorer()
  SnipRun()
  -- leap()
  -- tab()
  telescopeMappings()
  lspMappings()
  whichkey()
  -- lspsaga()
  -- git()
  -- window()

  -- migrate my old configs
  for mode, keybinding in pairs(mappings) do
    for key, value in pairs(keybinding) do
      if mode == 'n' then
        lvim.keys.normal_mode[key] = value[1]
      elseif mode == 'i' then
        lvim.keys.insert_mode[key] = value[1]
      elseif mode == 'v' then
        vim.keymap.set("v", key, value[1])
      end
    end
  end
end

Setup()
