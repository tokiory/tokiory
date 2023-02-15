-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP сервер
	use 'neovim/nvim-lspconfig'

	-- Прогресс LSP
	use {
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup({
				text = {
					spinner = "star",
					commenced = "Запускаю гусей🦆🦆🦆",
					completed = "Гуси готовы автодополнять🦆"
				},
				align = {
					bottom = false
				}
			})
		end
	}

	use({
		'ray-x/navigator.lua',
		requires = {
			{ 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
		config = function()
			require'navigator'.setup()
		end
	})

	-- Удобное меню для обозрения проблем LSP
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end,
	}

	-- Автодополнение
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua'
		},
		config = function()
			require('plugins/cmp')
		end
	}

	-- Иконки для автодополнения
	use {
		'onsails/lspkind-nvim',
		config = function()
			require('plugins/lspkind')
		end
	}

	-- Структура для LSP
	use {
		'simrat39/symbols-outline.nvim',
		config = function()
			require('plugins/symbols-outline')
		end,
	}

	-- Инсталлер для серверов LSP
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('plugins/lsp-installer')
		end
	}

	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}


	-- Git
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
		config = function()
			require('gitsigns').setup()
		end
	}

	-- Темы для Neovim
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function ()
			vim.g.catppuccin_flavour = "macchiato"
			vim.cmd[[color catppuccin]]
		end
	})

	use({
		'sainnhe/gruvbox-material',
		config = function ()
			-- vim.cmd[[color gruvbox-material]]
		end
	})

	-- Nord
	use {
		'arcticicestudio/nord-vim',
		config = function ()
			vim.cmd[[color nord]]
		end
	}

	-- Статуслайн
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('plugins/lualine')
		end
	}

	-- Проводник
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires  = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

	-- Комментарии
	use {
		'b3nj5m1n/kommentary',
		config = function()
			require('kommentary.config').configure_language("typescript", {
				single_line_comment_string = "//",
				multi_line_comment_strings = { "/*", "*/" },
			})
		end,
	}

	-- Плагин для подсветки синтаксиса
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins/tree-sitter')
		end
	}

	-- Плагин для автодополнения скобок и кавычек
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup {}
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Стутусбар для буферов
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins/buffline')
		end
	}

	-- Тесты в Neovim
	use {
		"vim-test/vim-test",
	}

	-- Документация
	use {
		'danymat/neogen',
		config = function ()
			require('neogen').setup {
				enabled = true,
				input_after_comment = true,
			}
		end
	}
end)
