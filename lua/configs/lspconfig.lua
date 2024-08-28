local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
	},
	automatic_installation = true,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		})
	end,
})

lspconfig.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if
			vim.loop.fs_stat(path .. "/.luarc.json")
			or vim.loop.fs_stat(path .. "/.luarc.jsonc")
		then
			return
		end

		client.config.settings.Lua =
			vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = {
						"vim",
					},
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
						"${3rd}/busted/library",
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					},
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			})
	end,
	settings = {
		Lua = {},
	},
})
