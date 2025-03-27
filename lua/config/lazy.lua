local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    -- 1. LazyVim core
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- 2. LazyVim extras (optional modules)
    { import = "lazyvim.plugins.extras.vscode" },       -- VSCode integration
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- e.g. TypeScript LSP extra
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- etc. 
    -- (Add any other LazyVim extras for your needs)
    -- 3. Your plugins
    { import = "plugins" },
  },
})