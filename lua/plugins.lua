local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then -- If packer is not already present
    bootstrap = vim.fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
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
                border = "rounded"
            })
        end,
    },
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
        config = function() require("plugins/bufferline") end,
    })

    -- Status line
    use({
        "feline-nvim/feline.nvim",
        config = function() require("plugins/feline") end,
    })
    -- use({
    -- 	"glepnir/galaxyline.nvim",
    -- 	config = function() require("plugins/galaxyline") end,
    -- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
    -- })

    -- Theme
    use({
        "nekonako/xresources-nvim",
    })

    use({
        "kyazdani42/nvim-web-devicons",
        config = function() require("plugins/icons") end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function() require("plugins/treesitter") end,
    })

    use({
        "DingDean/wgsl.vim",
    })

    -- Nvim tree sidebar
    --use({
    --	"kyazdani42/nvim-tree.lua",
    --	config = function() require("plugins/nvimtree") end,
    --})

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        config = function() require("plugins/cmp") end,
    })

    use({
        "hrsh7th/cmp-nvim-lsp",
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
    })

    use({
        "williamboman/mason-lspconfig.nvim",
    })

    use({
        "neovim/nvim-lspconfig",
        config = function() require("plugins/lsp") end,
    })

    use({
        "ray-x/lsp_signature.nvim",
    })

    use({
        "hrsh7th/vim-vsnip",
    })

    use({
        "hrsh7th/vim-vsnip-integ",
    })

    -- Git integration
    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function() require("plugins/gitsigns") end,
    })

    -- Convenience stuff
    use({
        "windwp/nvim-autopairs",
        config = function() require("plugins/autopairs") end,
    })

    use({
        "mhartington/formatter.nvim",
        config = function() require("plugins/formatter") end,
    })

    use({
        "norcalli/nvim-colorizer.lua",
        config = function() require("plugins/colorizer") end,
    })

    use({
        "wfxr/minimap.vim",
        config = function() require("plugins/minimap") end,
    })
end)
