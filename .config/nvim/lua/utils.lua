-- thanks to [at]nicknisi
-- https://github.com/nicknisi/dotfiles/blob/main/config/nvim/lua/utils.lua
local api = vim.api
local fn = vim.fn
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local utils = {}
local fun = require('fun')

-- thanks to
-- https://github.com/akinsho/dotfiles/blob/main/.config/nvim/lua/as/globals.lua
-- for inspiration
local function make_keymap_fn(mode, o)
  -- copy the opts table as extends will mutate opts
  local parent_opts = vim.deepcopy(o)
  return function(combo, mapping, opts)
    assert(combo ~= mode, string.format("The combo should not be the same as the mode for %s", combo))
    local _opts = opts and vim.deepcopy(opts) or {}

    if type(mapping) == "function" then
      local fn_id = globals._create(mapping)
      mapping = string.format("<cmd>lua globals._execute(%s)<cr>", fn_id)
    end

    if _opts.bufnr then
      local bufnr = _opts.bufnr
      _opts.bufnr = nil
      _opts = vim.tbl_extend("keep", _opts, parent_opts)
      api.nvim_buf_set_keymap(bufnr, mode, combo, mapping, _opts)
    else
      api.nvim_set_keymap(mode, combo, mapping, vim.tbl_extend("keep", _opts, parent_opts))
    end
  end
end

local map_opts = {noremap = false, silent = true}
utils.nmap = make_keymap_fn("n", map_opts)
utils.xmap = make_keymap_fn("x", map_opts)
utils.imap = make_keymap_fn("i", map_opts)
utils.vmap = make_keymap_fn("v", map_opts)
utils.omap = make_keymap_fn("o", map_opts)
utils.tmap = make_keymap_fn("t", map_opts)
utils.smap = make_keymap_fn("s", map_opts)
utils.cmap = make_keymap_fn("c", map_opts)

local noremap_opts = {noremap = true, silent = true}
utils.nnoremap = make_keymap_fn("n", noremap_opts)
utils.xnoremap = make_keymap_fn("x", noremap_opts)
utils.vnoremap = make_keymap_fn("v", noremap_opts)
utils.inoremap = make_keymap_fn("i", noremap_opts)
utils.onoremap = make_keymap_fn("o", noremap_opts)
utils.tnoremap = make_keymap_fn("t", noremap_opts)
utils.cnoremap = make_keymap_fn("c", noremap_opts)

function utils.has_map(map, mode)
  mode = mode or "n"
  return fn.maparg(map, mode) ~= ""
end

function utils.has_module(name)
  if
    pcall(
      function()
        require(name)
      end
    )
   then
    return true
  else
    return false
  end
end

function utils.termcodes(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end


function utils.apply_options(options)
   fun.each(
        function(k,v) opt[k] = v end,
        options
   )
end

function utils.apply_cmd(cmds)
    fun.each(
        function(v) cmd(v) end,
        cmds
    )
end

function utils.apply_g(gs)
    fun.each(
        function(k,v) g[k] = v end,
        gs
    )
end

function utils.apply_mappings(mappings)
  fun.each(
    function(k, vs)
      if k == "vmap" then
        fun.each(
          utils.vmap,
          vs
        )
      end

      if k == "nnoremap" then
        fun.each(
          utils.nnoremap,
          vs
        )
      end

      if k == "nmap" then
        fun.each(
          utils.nmap,
          vs
        )
      end
    end,

    mappings
  )
end

function utils.apply_settings(settings)
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
end

return utils
