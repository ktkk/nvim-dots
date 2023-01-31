local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then -- If packer is not already present
	bootstrap = vim.fn.system({
		"git", "clone", "--depth", "1",
		"https://github.com/wbthomason/packer.nvim",
		dir,
	})
	vim.api.nvim_command("packadd packer.nvim")
end

vim.api.nvim_create_autocmd( -- Recompile packer when this file gets edited
	{
		"BufWritePost",
	},
	{
		pattern = {
			"plugins.lua",
		},
		callback = function()
			vim.api.nvim_command("PackerCompile")
		end,
	}
)

local present, packer = pcall(require, "packer")
if not present then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end
	}
})

return packer.startup(function(use)
	-- Let Packer manage itself
	use({
		"wbthomason/packer.nvim",
		event = "VimEnter"
	})

	-- Buffer bar
	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("config/bufferline")
		end,
	})

	-- Status line
	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("config/feline")
		end,
	})

	-- Theme
	use({
		"nekonako/xresources-nvim",
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("config/icons")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = "TSUpdate",
		config = function()
			require("config/treesitter")
		end,
	})

	use({
		"DingDean/wgsl.vim",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("config/cmp")
		end,
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	})

	-- LSP stuff
	use({
		"williamboman/mason.nvim",
        config = function()
			require("config/mason")
		end
	})

	use({
		"neovim/nvim-lspconfig",
		after = "mason.nvim",
		config = function()
			require("plugins/lsp")
		end,
	})

	use({
		"onsails/lspkind-nvim",
	})

	use({
		"hrsh7th/vim-vsnip",
	})

	use {
		"hrsh7th/vim-vsnip-integ",
	}

	-- Git integration
	use {
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function() require("plugins/gitsigns") end,
	}

	-- Convenience stuff
	use {
		"windwp/nvim-autopairs",
		config = function() require("plugins/autopairs") end,
	}

	use {
		"mhartington/formatter.nvim",
		config = function() require("plugins/formatter") end,
	}

	use {
		"norcalli/nvim-colorizer.lua",
		config = function() require("plugins/colorizer") end,
	}

	use {
		"wfxr/minimap.vim",
		config = function() require("plugins/minimap") end,
	}
end)
