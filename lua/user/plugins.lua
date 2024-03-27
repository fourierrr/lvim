-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

local plugins = {
	-- { "Exafunction/codeium.vim" },
	{
		"Pocco81/auto-save.nvim",
	},
	{
		"github/copilot.vim",
	},
	{
		"ojroques/vim-oscyank",
	},
	{
		"theHamsta/nvim-dap-virtual-text",
	},
	{
		"nvim-telescope/telescope-dap.nvim",
	},
	{
		"leoluz/nvim-dap-go",
	},
	{
		"michaelb/sniprun",
		build = "bash ./install.sh",
		event = "BufRead",
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- },
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- telescope 所需
			"MunifTanjim/nui.nvim",

			-- 可选
			"nvim-treesitter/nvim-treesitter",
			-- "rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- 配置放在这里
      lang = "golang",
			cn = {
				enabled = true,
			},
		},
	},
	{
		"ethanholz/nvim-lastplace",
	},
	{
		"xiyaowong/transparent.nvim",
	},
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"simrat39/symbols-outline.nvim",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
	},
	{
		"kkharji/lspsaga.nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"mhartington/formatter.nvim",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

local colorschemes = {
	-- { "luisiacc/gruvbox-baby" },
	-- { "nyoom-engineering/oxocarbon.nvim" },
	{ "catppuccin/nvim" },
	-- { "EdenEast/nightfox.nvim" },
	-- { "marko-cerovac/material.nvim" },
}

for _, value in ipairs(colorschemes) do
	table.insert(plugins, value)
end

-- require("lvim-user.plugins.nvim-ide")

return plugins
