local fn = vim.fn
local M = {}

local indent = 2

M.options = {
  encoding = "utf8",
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

M.g_options = {
  -- theme
  elite_mode = 1,
  edge_style = 'neon',
  -- wikis
  vimwiki_list = {
    { path = '~/wikis/', syntax = 'markdown', ext = '.md' }
  },
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
     folders = 1,
     files = 1,
  },
  -- markdown preview
  mkdp_browser = 'chrome',
dashboard_disable_at_vimenter = 0,
dashboard_disable_statusline = 1,
dashboard_default_executive = "telescope",
dashboard_custom_header = {
-- functional
---- programming
----- forever
"                ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                ",
"            ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░              ",
"          ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒            ",
"        ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓          ",
"      ░▓███▓▒████████████░░░▒██████████▓░▓██▓        ",
"     ▒████▒▓█████████████▓░░░▓███████████░▓███▒      ",
"    ▒████▓▒███████████████░░░░████████████░████▒     ",
"   ▒█████░███████████████▓░░░░▒███████████▒▒████▒    ",
"  ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░   ",
" ░██████▓▒██████████████▒▓███░░░▓██████████░██████░  ",
" ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░  ",
" ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒  ",
" ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓  ",
" ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒  ",
" ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░  ",
" ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░  ",
"  ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░   ",
"  ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒    ",
"   ░▒██████████████████▓░░░░███████████████████▒     ",
"     ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░      ",
"      ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒        ",
"        ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒          ",
"           ░▓███████▒▓▒▒░░░░░▒▓████████▓▒            ",
"              ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░               ",
"                      ▒▒▒▓▓▓▒▒                       "
},

dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
   e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
},

dashboard_custom_footer = {"   "}

}

M.cmd_options = {
  "filetype plugin on",
  "syntax on",
  "silent! colorscheme edge",
  "nnoremap <SPACE> <Nop>",
  "let mapleader = ' '"
}

M.mappings = {
  vmap = {
    -- Copy & paste to system clipboard with {<Space> + p} and {<Space> + y}
    ['<Leader>y'] = '"+y',
    ['<Leader>d'] = '"+d',
    ['<Leader>p'] = '"+p',
    ['<Leader>P'] = '"+P',
  },

  nnoremap = {
    -- telescope mappings
    ["<Leader>ff"] = "<cmd>lua require('telescope.builtin').find_files()<cr>",
    ["<Leader>fg"] = "<cmd>lua require('telescope.builtin').live_grep()<cr>",
    ["<Leader>fb"] = "<cmd>lua require('telescope.builtin').buffers()<cr>",
    ["<Leader>fh"] = "<cmd>lua require('telescope.builtin').help_tags()<cr>",
    ["<Leader>md"] = "<cmd>MarkdownPreviewToggle<cr>"
  },

  nmap = {
    ["<C-n>"] = "<cmd>NvimTreeToggle<cr>",
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
    M.cmd_options,
    [[tnoremap <Esc> <C-\\><C-n>]]
  )
end

return M
