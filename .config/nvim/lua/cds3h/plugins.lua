local status,packer = pcall(require,'packer')
if(not status) then 
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' --packer
  use {
    'svrana/neosolarized.nvim',
    requires = {'tjdevries/colorbuddy.nvim'}
  } -- neosolorized color background
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- lsp
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ' :TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
end)
