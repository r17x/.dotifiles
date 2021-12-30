-- @see https://neovim.io/doc/user/lua.html
local fn = vim.fn
local settings = require('settings')
-- bootstrap packer (package manager for plugin neovim)
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      {'nkrkv/nvim-treesitter-rescript', run = ':TSInstall rescript'}
    }
  }
  -- Lazy loading:
  -- Load on specific commands
  use {
    'tpope/vim-dispatch',
    opt = true,
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  }
  -- theme
  use {'sainnhe/edge'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- tree
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   opt = true,
  --   cmd = {'NvimTreeToggle'},
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }
  --
  -- finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  -- lsp
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      'L3MON4D3/LuaSnip' -- Snippets plugin
    },
  }

  -- TODO writing
  -- I think just make telescope extension
  -- and rewrite jeffmm/vim-roam
  -- use {
  --   'ri7nz/vim-roam',
  --   requires = {
  --     'vimwiki/vimwiki',
  --   }
  -- }
  -- use {
  --   "vimwiki/vimwiki"
  -- }
  use {
    'jeffmm/vim-roam',
    cmd = 'RoamSearchText',
    requires = {
       'vimwiki/vimwiki',
       'junegunn/fzf',
       'junegunn/fzf.vim'
    }
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  -- Put this at the end after all plugins
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end
end)
-- language server protocol (lsp) configurations
require('lsp')
-- apply all settings
require('utils').apply_settings(settings)
if settings.lualine then
  require('lualine').setup(settings.lualine)
end
-- Change cwd to current dir
vim.cmd("cd %:p:h")
