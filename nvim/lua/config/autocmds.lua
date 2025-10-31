-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

require("snacks.util").lsp.on(function(buffer, client)
  local augroup_id = vim.api.nvim_create_augroup("FormatModificationsDocumentFormattingGroup", { clear = false })
  vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = buffer })

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup_id,
    buffer = buffer,
    callback = function()
      local lsp_format_modifications = require("lsp-format-modifications")
      lsp_format_modifications.format_modifications(client, buffer)
    end,
  })
end)

local set_autoformat = function(pattern, bool_val)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = bool_val
    end,
  })
end

set_autoformat({ "cpp" }, false)
set_autoformat({ "c" }, false)
-- set_autoformat({ "fish" }, false)
-- set_autoformat({ "lua" }, false)
-- set_autoformat({ "perl" }, false)
-- set_autoformat({ "yaml" }, false)
