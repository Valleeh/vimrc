-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then
-- ~/.config/nvim/lua/plugins/substitute.lua
return {
  -- Substitute plugin for s/Motion replacement
  {
    "gbprod/substitute.nvim",
    keys = {
      { "s",  function() require("substitute").operator() end, mode = "n", desc = "Substitute motion" },
      { "ss", function() require("substitute").line() end,     mode = "n", desc = "Substitute line" },
      { "S",  function() require("substitute").eol() end,      mode = "n", desc = "Substitute to end-of-line" },
      { "s",  function() require("substitute").visual() end,   mode = "x", desc = "Substitute selection" },
    },
    opts = {},    -- use default settings (you can add `yank_substituted_text = true`, etc., if desired)
    vscode = true -- ensure it loads in VSCode (bypass LazyVim's filter)&#8203;:contentReference[oaicite:31]{index=31}
  },

  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
  "mg979/vim-visual-multi"
  },
  -- Disable Leap/Flit to avoid conflict with 's' keymaps
  { "ggandor/leap.nvim",  enabled = false },
  { "ggandor/flit.nvim",  enabled = false },
}

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- if vim.g.vscode then
--     print("hello from plugins")
--     return{{'EtiamNullam/deferred-clipboard.nvim',
--     config= function()
--     require('deferred-clipboard').setup {
--       fallback = 'unnamedplus', -- or your preferred setting for clipboard
--   }
--     end
--   },
--   {
--       "gbprod/substitute.nvim",
--         config = function()
--         require("substitute").setup({
--           -- your configuration comes here
--           -- or leave it empty to use the default settings
--           -- refer to the configuration section below
--                          })
--                          end
--   },}
-- else
-- --     -- ordinary Neovim
-- --   rend
--       print("hallo")
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },

--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },

--     {
--       "gbprod/substitute.nvim",
--       config = function()
--         require("substitute").setup({
--           highlight_substituted_text = {
--             enabled = true,
--             timer = 50,
--           },
--         })
--         local substitute = require("substitute")
--         vim.keymap.del("n", "s")
--       print("hallo")
--         vim.keymap.set("n", "s", substitute.operator, { noremap = true, desc = "Substitute operator" })
--         vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "Substitute line" })
--         vim.keymap.set("n", "S", substitute.eol, { noremap = true, desc = "Substitute to end-of-line" })
--         vim.keymap.set("x", "s", substitute.visual, { noremap = true, desc = "Substitute visual selection" })
--       end,
--     },
  
-- {
--   "nvim-lua/plenary.nvim",
-- },
-- {
-- "ThePrimeagen/vim-be-good"
-- },
-- {
-- "mg979/vim-visual-multi"
-- },
-- {
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({ mappings_style = "surround" })
--   end,
-- },
-- {
--   "ThePrimeagen/harpoon",
--   config = function()
--     require("harpoon").setup({

-- vim.keymap.set("n", "<leader>1", function()  require("harpoon.ui").nav_file(1) end),
-- vim.keymap.set("n", "<leader>2", function()  require("harpoon.ui").nav_file(2) end),
-- vim.keymap.set("n", "<leader>3", function()  require("harpoon.ui").nav_file(3) end),
-- vim.keymap.set("n", "<leader>4", function()  require("harpoon.ui").nav_file(4) end),
-- vim.keymap.set("n", "<leader>5", function()  require("harpoon.ui").nav_file(5) end),
-- vim.keymap.set("n", "<leader>6", function()  require("harpoon.ui").nav_file(6) end),
-- vim.keymap.set("n", "<leader>fa", require("harpoon.mark").add_file),
-- vim.keymap.set("n", "<leader>frr", require("harpoon.ui").toggle_quick_menu),
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     })
--   end
-- },
--   -- Use <tab> for completion and snippets (supertab)
--   -- first: disable default <tab> and <s-tab> behavior in LuaSnip
--   {
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       return {}
--     end,
--   },
--   -- then: setup supertab in cmp
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-emoji",
--     },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--       end

--       local luasnip = require("luasnip")
--       local cmp = require("cmp")

--       opts.mapping = vim.tbl_extend("force", opts.mapping, {
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--             -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--             -- this way you will only jump inside the snippet region
--           elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--           elseif has_words_before() then
--             cmp.complete()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })
--     end,
--   },
-- }