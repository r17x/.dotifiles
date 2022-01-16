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
    config = function() require 'nvim-tree'.setup() end,
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
      config = function ()
       require "lsp_signature".setup {
           bind = true,
           doc_lines = 0,
           floating_window = true,
           fix_pos = true,
           hint_enable = true,
           hint_prefix = " ",
           hint_scheme = "String",
           hi_parameter = "Search",
           max_height = 22,
           max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
           handler_opts = {
              border = "single", -- double, single, shadow, none
           },
           zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
           padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        }
      end
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

  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { "markdown" }
  }

  use {
    "glepnir/dashboard-nvim",
  }

end

return packer.startup(fly)
