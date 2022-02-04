local present, packer = pcall(require, "plugins.manager")

if not present then
   return false
end

local config_load = function(...)
  local req = ""
  for _, conf in ipairs({...}) do
    req = ("").format("%s require('%s')",req, conf)
  end
  return req
end

local fly = function(use)
  use { 'wbthomason/packer.nvim' }
  -- theme list
  use {'sainnhe/edge'}

  -- syntax highlight (treesitter)
  use {
    'ri7nz/nvim-treesitter',
    run = ':TSUpdate',
    config = config_load 'plugins.config.treesitter',
    event = "BufRead"
  }

  use {
    "reasonml-editor/vim-reason-plus",
    ft = { "reason" }
  }

  use {
    'nkrkv/nvim-treesitter-rescript',
    run = ':TSInstall rescript',
    after = "nvim-treesitter"
  }

  use {
    'kyazdani42/nvim-web-devicons',
    event = "BufRead"
  }

  -- tree (like sidebar navigation for tree files)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    setup = config_load 'plugins.setup.nvim-tree',
    config = config_load 'plugins.config.nvim-tree',
    cmd = {
      "NvimTreeRefresh",
      "NvimTreeToggle"
    }
  }

  use {
    'tpope/vim-dispatch',
    opt = true,
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    after = "nvim-web-devicons",
    requires = {'kyazdani42/nvim-web-devicons'},
    config = config_load 'plugins.config.lualine',
    event = 'BufRead'
  }
  -- finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    },
    module = 'telescope',
    event = "VimEnter"
  }
  -- lsp
  use {
    'ri7nz/nvim-lsp-installer',
    branch = "feat/add-reason-installer",
    run = ":LspInstall sumneko_lua rescriptls tsserver eslint",
    config = config_load("lspconfig", "plugins.config.lsp"),
    event = "BufRead"
  }

  use {
    'ri7nz/nvim-lspconfig',
    branch = 'add-reason',
    module = "lspconfig"
  }

   use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = config_load 'plugins.config.lsp.signature'
   }


  -- LSP Completion
  use {
    'rafamadriz/friendly-snippets',
    event = "InsertEnter",
  }

  use {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
    config = config_load 'plugins.config.lsp.cmp'
  }

  use {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  }

  use {
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    after = 'nvim-cmp'
  }

  use {
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp'
  }

  use {
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp'
  }

  use {
    'hrsh7th/cmp-path',
    after = 'nvim-cmp'
  }

  use {
    'L3MON4D3/LuaSnip', -- Snippets plugin
    after = 'nvim-cmp',
    wants = "friendly-snippets"
  }

  use {
    "windwp/nvim-autopairs",
    event = "VimEnter",
    config = config_load "plugins.config.autopairs"
  }

  --- git integrations
  use {
    "lewis6991/gitsigns.nvim",
    config = config_load 'plugins.config.gitsigns'
  }

  use { 
    "lambdalisue/gina.vim",
    cmd = {"Gina"}
  }

  use { 'vimwiki/vimwiki', event = "VimEnter"}

  use {
    'jeffmm/vim-roam',
    cmd = {
      "RoamSearchText",
      "RoamSearchFiles",
      "RoamSearchTags",
      "RoamInbox",
      "RoamNewNote"
    }
  }

  use {
    'junegunn/fzf',
    after = "vim-roam"
  }

  use { 'junegunn/fzf.vim', after = "vim-roam"}

  --- WRITING
  -- markdown toc
  use {
   'junegunn/goyo.vim',
   cmd = {
     "Goyo"
   },
   config = function ()
    vim.cmd [[ autocmd! User GoyoEnter Limelight ]]
    vim.cmd [[ autocmd! User GoyoLeave Limelight! ]]
   end
  }

  use {
    'junegunn/limelight.vim',
    cmd = "Limelight"
  }

  use {
    'mzlogin/vim-markdown-toc',
    cmd = {
      'GenTocGFM'
    }
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { "markdown", "vimwiki"},
    setup = config_load 'plugins.setup.mkdp'
  }

  --- MISC

  use {
    "nathom/filetype.nvim",
    setup = config_load 'plugins.setup.filetype',
    config = config_load 'plugins.config.filetype',
  }

  use {
    "glepnir/dashboard-nvim",
    setup = config_load 'plugins.setup.dashboard'
  }

  use {
   'wakatime/vim-wakatime',
   event = "BufRead"
  }

  use {
   'lukas-reineke/indent-blankline.nvim',
   event = "BufRead",
   config = config_load 'plugins.config.blankline'
  }

  use {
    'kristijanhusak/vim-carbon-now-sh',
    cmd = {"CarbonNowSh"},
    setup = function () require 'utils'.apply_mappings( { xnoremap = { ["<Leader>cc"] = "<cmd>CarbonNowSh<cr>" } }) end
  }
end

return packer.startup(fly)
