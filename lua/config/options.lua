-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- lua/config/options.lua
vim.opt.clipboard = "unnamedplus"        -- Yank to system clipboard&#8203;:contentReference[oaicite:9]{index=9}
vim.opt.number = true                   -- Show line numbers
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.ignorecase = true
vim.opt.smartcase = true                -- Better search (ignore case until a capital letter is used)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true                -- Use spaces instead of tabs
if vim.g.vscode then
    -- Use VSCode's clipboard integration when in VSCode
    vim.g.clipboard = vim.g.vscode_clipboard
end
-- (Add any other `set ...` from your init.vim in the form vim.opt[...] = ... )
