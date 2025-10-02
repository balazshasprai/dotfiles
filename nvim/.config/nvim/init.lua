-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
-- require("config.lsp")
vim.cmd[[colorscheme dracula]]
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- ✅ Toggle terminal with Ctrl + \
vim.keymap.set('n', '<C-\\>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('t', '<C-\\>', '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = 'Toggle terminal' })

-- vim.filetype.add({
--   extension = {
--     foo = "python",   -- all *.foo files will be treated as Python
--     tpl = "gotexttmpl", -- *.tpl as Go text templates
--     hcl = "hcl",      -- *.hcl as HashiCorp config
--   },
-- })

vim.filetype.add({
  filename = {
    ["values.yaml"] = "helm",
  },
  pattern = {
    ["*/templates/*.yaml"] = "helm",
    ["*/templates/*.tpl"]  = "helm",
    ["*/charts/*/templates/*.yaml"] = "helm",
  },
})
