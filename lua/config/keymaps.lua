-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- lua/config/keys.lua

-- Leader key (if you want to set a custom one, otherwise LazyVim defaults to <Space>)
-- vim.g.mapleader = " "  -- (LazyVim sets Space by default)

-- **Telescope Keymaps** (Fuzzy Finder)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files (Telescope)" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep Text (Telescope)" })
-- (Add other Telescope mappings like buffers, help tags, etc., as needed)

-- **Harpoon Keymaps**
vim.keymap.set("n", "<leader>a", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon Mark File" })
vim.keymap.set("n", "<leader>h", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon Menu" })
-- (If you had specific keys for navigating to Harpoon marks, e.g. <M-1>, <M-2>, you can set them similarly calling require('harpoon.ui').nav_file(1) etc.)

-- **FZF Keymaps**
vim.keymap.set("n", "<leader>sf", "<cmd>Files<CR>", { desc = "FZF Find File" })
vim.keymap.set("n", "<leader>sb", "<cmd>Buffers<CR>", { desc = "FZF Buffers" })
-- (These assume the fzf.vim plugin commands :Files, :Buffers, etc. Adjust leader keys as per your original config.)
-- vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
-- vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
-- vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
-- vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })
-- **Window Navigation (Normal mode)**
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to right window" })

-- **Window Navigation (Terminal mode)**
vim.keymap.set("t", "<M-h>", [[<C-\><C-n><C-w>h]], { desc = "Terminal: move left", noremap = true })
vim.keymap.set("t", "<M-j>", [[<C-\><C-n><C-w>j]], { desc = "Terminal: move down", noremap = true })
vim.keymap.set("t", "<M-k>", [[<C-\><C-n><C-w>k]], { desc = "Terminal: move up", noremap = true })
vim.keymap.set("t", "<M-l>", [[<C-\><C-n><C-w>l]], { desc = "Terminal: move right", noremap = true })

-- **Window Management** (Splits/Resizing example)
vim.keymap.set("n", "<M-v>", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<M-s>", "<cmd>split<CR>", { desc = "Horizontal Split" })
-- (Add any other window management mappings you had, like closing a window, resizing with arrow keys, etc.)

-- You can also disable default LazyVim keymaps if they conflict, using vim.keymap.del().
-- For instance, if LazyVim set a mapping that you want to override, you can remove it here *before* defining your own.
if vim.g.vscode then
  local vscode = require("vscode")

  -- Example: Reveal definition aside with <C-w>gd
  vim.keymap.set("n", "<C-w>gd", function()
    vscode.action("editor.action.revealDefinitionAside")
  end, { silent = true, desc = "Reveal Definition Aside" })

  -- Example: Find in files for word under cursor with ?
  vim.keymap.set("n", "?", function()
    vscode.action("workbench.action.findInFiles", { args = { query = vim.fn.expand("<cword>") } })
  end, { silent = true, desc = "Find in Files" })

  -- Navigation commands (you can adjust as needed):
  vim.keymap.set("n", "]c", function()
    vscode.action("workbench.action.editor.nextChange")
  end, { silent = true, desc = "Next Change" })
  vim.keymap.set("n", "[c", function()
    vscode.action("workbench.action.editor.previousChange")
  end, { silent = true, desc = "Previous Change" })
  vim.keymap.set("n", "<C-k>", function()
    vscode.action("editor.action.showHover")
  end, { silent = true, desc = "Show Hover" })

  vim.keymap.set("n", "gd", function()
    local cmd = (vim.v.count and vim.v.count > 0) and "typescript.goToSourceDefinition"
      or "editor.action.revealDefinition"
    vscode.action(cmd)
  end, { silent = true, desc = "Go to Definition" })

  vim.keymap.set("n", "gD", function()
    vscode.action("editor.action.goToImplementation")
  end, { silent = true, desc = "Go to Implementation" })

  vim.keymap.set("n", "gr", function()
    vscode.action("references-view.find")
  end, { silent = true, desc = "Find References" })

  vim.keymap.set("n", "gR", function()
    vscode.action("references-view.findImplementations")
  end, { silent = true, desc = "Find Implementations" })

  vim.keymap.set("n", "<leader>db", function()
    vscode.action("editor.debug.action.toggleBreakpoint")
  end, { silent = true, desc = "Toggle Breakpoint" })

  -- Chain multiple commands for <leader><BS>fr:
  vim.keymap.set("n", "<leader><BS>fr", function()
    vscode.action("workbench.action.openEditorAtIndex6")
    vscode.action("workbench.action.openEditorAtIndex5")
    vscode.action("workbench.action.openEditorAtIndex4")
    vscode.action("workbench.action.openEditorAtIndex3")
    vscode.action("workbench.action.openEditorAtIndex2")
    vscode.action("workbench.action.openEditorAtIndex1")
  end, { silent = true, desc = "Open Editors 6→1" })

  vim.keymap.set("n", "<leader>fa", function()
    vscode.action("workbench.action.pinEditor")
  end, { silent = true, desc = "Pin Editor" })

  vim.keymap.set("n", "<leader>fd", function()
    vscode.action("workbench.action.unpinEditor")
  end, { silent = true, desc = "Unpin Editor" })

  vim.keymap.set("n", "<leader>sv", function()
    vscode.action("workbench.action.reloadWindow")
  end, { silent = true, desc = "Reload Window" })

  vim.keymap.set("n", "<leader>z", function()
    vscode.action("workbench.action.toggleZenMode")
  end, { silent = true, desc = "Toggle Zen Mode" })

  vim.keymap.set("n", "<leader>a", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end, { silent = true, desc = "Toggle Sidebar" })

  vim.keymap.set("n", "<leader>t", function()
    vscode.action("workbench.action.togglePanel")
  end, { silent = true, desc = "Toggle Panel" })

  vim.keymap.set("n", "<leader>ct", function()
    vscode.action("workbench.action.quickOpenTerm")
  end, { silent = true, desc = "Quick Open Terminal" })
end

-- Normal mode mappings
vim.keymap.set("n", "<PageUp>", "<C-u>", { desc = "Half-page up" })
vim.keymap.set("n", "<PageDown>", "<C-d>", { desc = "Half-page down" })

-- The following two commented mappings (10k/10j) are not active:
-- vim.keymap.set("n", "<PageUp>", "10k")
-- vim.keymap.set("n", "<PageDown>", "10j")

vim.keymap.set("n", "<C-c>", "yiw", { desc = "Yank inner word" })
vim.keymap.set("n", "<C-v>", "siw", { desc = "Substitute inner word" })

vim.keymap.set("n", "<End>", "$", { desc = "Move to end of line" })
vim.keymap.set("n", "<Home>", "0", { desc = "Move to beginning of line" })

vim.keymap.set("n", "<A-right>", "<C-i>", { desc = "Map Alt+Right to <C-i>" })
vim.keymap.set("n", "<A-left>", "<C-o>", { desc = "Map Alt+Left to <C-o>" })

vim.keymap.set("n", "gf", "<cmd>e <cfile><CR>", { desc = "Open file under cursor" })

-- Insert mode mapping
vim.keymap.set("i", "<C-c>", "<NOP>", { desc = "Disable Ctrl-c in insert mode" })
