return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("configs.treesitter")
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
		config = function()
			require("configs.conform")
		end,
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		lazy = false,
		config = function()
			require("configs.mason-conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePre", "BufNewFile" },
		config = function()
			require("configs.lint")
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		lazy = false,
		config = function()
			require("configs.mason-lint")
		end,
	},
}
