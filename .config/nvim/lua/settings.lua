local fun = require('fun')
local fn = vim.fn
local Settings = {}

local indent = 2

Settings.options = {
  termguicolors = true,
  backspace = {"indent", "eol", "start"},
  cursorline = false,
  wrap = false,
  number = true,
  relativenumber = true,
  background = 'dark',
  tabstop = indent,
  shiftwidth = indent,
  smarttab = true,
  expandtab = true,
  laststatus = 2,
  foldmethod = 'syntax',
  compatible = false,
}

Settings.g_options = {
  -- theme
  elite_mode = 1,
  edge_style = 'neon',
  -- tree
  nvim_tree_side = 'left',
  
  nvim_tree_indent_markers = 1,
  nvim_tree_width_allow_resize = 1,
  nvim_tree_git_hl = 1,
  nvim_tree_width = 20,
  filters = {
    dotfiles = 1,
    ignore = { '__pycache__', '.git', 'node_modules', '.cache' }
  },
  
  nvim_tree_icons = {
     git = {
       unstaged = "✗",
       staged = "✓",
       unmerged = "x",
       renamed = "➜",
       untracked = "★"
     },
  },
  
  nvim_tree_show_icons = {
     git = 1,
     folders = 0,
     files = 0,
  },

}

Settings.cmd_options = {
  "filetype plugin on",
  "syntax on",
  "silent! colorscheme edge",
  "nnoremap <SPACE> <Nop>",
  "let mapleader = ' '"
}

Settings.mappings = {
  vmap = {
    -- Copy & paste to system clipboard with {<Space> + p} and {<Space> + y}
    ['<Leader>y'] = '"+y',
    ['<Leader>d'] = '"+d',
    ['<Leader>p'] = '"+p',
    ['<Leader>P'] = '"+P',
    ['<Leader>p'] = '"+p',
    ['<Leader>P'] = '"+P'
  },

  nnoremap = {
    -- telescope mappings
    ["<Leader>ff"] = "<cmd>lua require('telescope.builtin').find_files()<cr>",
    ["<Leader>fg"] = "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    ["<Leader>fb"] = "<cmd>lua require('telescope.builtin').buffers()<cr>",
    ["<Leader>fh"] = "<cmd>lua require('telescope.builtin').help_tags()<cr>"
  },

  nmap = {
    -- CTRL+[h,j,k,l] for movement buffer window
    -- Type {Ctrl+h} for navigated to left
    -- Type {Ctrl+j} for navigated to bottom
    -- Type {Ctrl+k} for navigated to up
    -- Type {Ctrl+l} for navigated to right
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Disable arrow movement, resize splits instead.
    -- <- : for resize(+2) to left
    -- -> : for resize(+2) to righ
    --  V : for resize(+2) to bottom
    --  ^ : for resize(+2) to up
    ["<Up>"]   = "<cmd>resize +2<cr>",
    ["<Down>"] = "<cmd>resize -2<CR>",
    ["<Left>"] =  "<cmd>vertical resize +2<CR>",
    ["<Right>"] = "<cmd>vertical resize -2<CR>"
  }
}

if fn.exists(":tnoremap") then
  table.insert(
    Settings.cmd_options,
    "tnoremap <Esc> <C-\\><C-n>"
  )
end

Settings.lualine = {
  options = {
    theme = 'edge',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}


return Settings
