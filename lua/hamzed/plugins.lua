-- Packer bootstaping 
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
--  use 'Luxed/ayu-vim'
	use 'Mofiqul/dracula.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'glepnir/lspsaga.nvim'
	use {
  	'williamboman/mason.nvim',
  	run = ':MasonUpdate' -- :MasonUpdate updates registry contents
	}
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason-lspconfig.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  use "williamboman/mason.nvim"
  end
end)
