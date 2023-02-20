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
    "ethanholz/nvim-lastplace",
  },
  {
    "xiyaowong/nvim-transparent",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
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
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    "simrat39/symbols-outline.nvim",
  }
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
