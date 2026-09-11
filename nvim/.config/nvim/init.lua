-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo(
      { { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
      true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.cmd [[colorscheme dracula]]

vim.keymap.set('n', '<C-\\>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('t', '<C-\\>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = 'Toggle terminal' })

vim.filetype.add({
  filename = {
    ["values.yaml"] = "helm",
  },
  pattern = {
    [".*Jenkinsfile"]               = "groovy",
    ["*/templates/*.yaml"]          = "helm",
    ["*/templates/*.tpl"]           = "helm",
    ["*/charts/*/templates/*.yaml"] = "helm",
  },
})

-- move lines
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })

vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("n", "<space>td", ":ToggleTerm dir=%:p:h<CR>") -- open terminal in the directory of the file

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "sh -c 'lazygit'",
  direction = "float",
  hidden = true,
})

vim.keymap.set("n", "<leader>gg", function()
  lazygit.dir = vim.fn.expand("%:p:h")
  lazygit:toggle()
end, { desc = "Toggle lazygit in current file dir" })

-- vim.keymap.set("n", "<leader>gg", function()
--   local dir = vim.fn.expand("%:p:h")
--   vim.cmd("TermExec cmd='lazygit' dir=" .. vim.fn.fnameescape(dir) .. " direction=float")
-- end, { desc = "Lazygit in current file dir" })

-- vim.keymap.set("n", "<leader>gg", function()
--   local dir = vim.fn.expand("%:p:h")
--   vim.cmd("TermExec cmd='bash --noprofile --norc -c \"lazygit\"' dir=" .. vim.fn.fnameescape(dir) .. " direction=float")
-- end, { desc = "Lazygit in current file dir" })
--
-- vim.keymap.set("n", "<leader>gG", function()
--   local dir = vim.uv.cwd()
--   vim.cmd("TermExec cmd='bash --noprofile --norc -c \"lazygit\"' dir=" .. vim.fn.fnameescape(dir) .. " direction=float")
-- end, { desc = "Lazygit in startup dir" })

-- local Terminal = require("toggleterm.terminal").Terminal
--
-- local lazygit_file_dir = Terminal:new({
--   cmd = "bash --noprofile --norc -c 'lazygit'",
--   direction = "float",
--   hidden = true,
-- })
--
-- local lazygit_cwd = Terminal:new({
--   cmd = "bash --noprofile --norc -c 'lazygit'",
--   direction = "float",
--   hidden = true,
-- })
--
-- vim.keymap.set("n", "ngg", function()
--   lazygit_file_dir.dir = vim.fn.expand("%:p:h")
--   lazygit_file_dir:toggle()
-- end, { desc = "Lazygit in current file dir" })
--
-- vim.keymap.set("n", "ngG", function()
--   lazygit_cwd.dir = vim.fn.getcwd(-1, -1)
--   lazygit_cwd:toggle()
-- end, { desc = "Lazygit in Neovim start dir" })

-- vim.keymap.set("n", "<space>gG", function()
--   local dir = vim.fn.expand("%:p:h")
--   vim.cmd("TermExec cmd='lazygit' dir=" .. vim.fn.fnameescape(dir) .. " direction=float")
-- end, { desc = "Floating lazygit in current file dir" })


-- vim.opt.hidden = true
