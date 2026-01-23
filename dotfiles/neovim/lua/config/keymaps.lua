-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- Jump out of Insert quickly
-- For some reason when doing a change motion that sends changed text to the black hole registers...
-- ... the following yank tries to yank from the black hole register as well, hence the additional <esc>
map("i", "jk", "<esc><esc>", { desc = "quickly escape insert mode" })
map("i", "kj", "<esc><esc>", { desc = "quickly escape insert mode" })
map("i", "<esc>", "<esc><esc>", { noremap = true, desc = "" })

-- Prioritize yanked text over anything else
-- If you need a cut operation, use x
map("n", "d", '"_d', { noremap = true, desc = "" })
map("n", "D", '"_D', { noremap = true, desc = "" })
map("n", "c", '"_c', { noremap = true, desc = "" })
map("n", "C", '"_C', { noremap = true, desc = "" })
map("v", "d", '"_d', { noremap = true, desc = "" })
map("v", "c", '"_c', { noremap = true, desc = "" })

-- paste multiple times
map("x", "p", "pgvy", { noremap = true, desc = "Paste multiple times" })

-- New lines above and below
map("n", "<leader>o", "o<esc>", { desc = "New line below" })
map("n", "<leader>O", "O<esc>", { desc = "New line above" })

-- Move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line up" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line down" })

-- Buffer keymaps
map("n", "<tab>", ":bnext<cr>", { noremap = true, silent = true, desc = "Tab buffers next" })
map("n", "<s-tab>", ":bprevious<cr>", { noremap = true, silent = true, desc = "Tab buffers previous" })
map("n", "<leader>d", ":bdelete<cr>", { noremap = true, silent = true, desc = "Delete current buffer" })

map("n", "<test>d", ":bdelete<cr>", { noremap = true, silent = true, desc = "Delete current buffer" })

-- Resize windows
-- map("n", "<C-->", "<cmd>resize -5<cr>", { remap = true, silent = true, desc = "Decrease vertically; alt+s" })
-- map("n", "<C-=>", "<cmd>resize +5<cr>", { remap = true, silent = true, desc = "Increase vertically; alt+k" })
-- map("n", "<C-_>", "<cmd>vertical resize -5<cr>", { remap = true, silent = true, desc = "Decrease horizontally; alt+d" })
-- map("n", "<C-+>", "<cmd>vertical resize +5<cr>", { remap = true, silent = true, desc = "Increase horizontally; alt+a" })
-- If using iterm, make sure the option key is set to Meta
-- map("n", "<A-s>", "<cmd>resize -5<cr>", { remap = true, silent = true, desc = "Decrease vertically; alt+s" })
-- map("n", "<A-w>", "<cmd>resize +5<cr>", { remap = true, silent = true, desc = "Increase vertically; alt+k" })
-- map("n", "<A-a>", "<cmd>vertical resize -5<cr>", { remap = true, silent = true, desc = "Decrease horizontally; alt+d" })
-- map("n", "<A-d>", "<cmd>vertical resize +5<cr>", { remap = true, silent = true, desc = "Increase horizontally; alt+a" })
