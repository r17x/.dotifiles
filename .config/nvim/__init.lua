local settings = require('settings')
local utils = require('utils')


-- apply "g" options
-- viml: let g:something = val
utils.apply_g(settings.g_options)
-- apply options
-- viml: set something
utils.apply_options(settings.options)
-- apply command
-- viml: something on
utils.apply_cmd(settings.cmd_options)
-- apply mappings
-- viml: nnoremap something value
utils.apply_mappings(settings.mappings)

require('plugins')

if settings.lualine then
  require('lualine').setup(settings.lualine)
end

-- TODO require('lsp')
-- require('setup.tree')
-- Change cwd to current dir
vim.cmd("cd %:p:h")
