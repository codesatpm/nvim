-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local asd = nil
M.ui = {
	theme = "gruvbox",
	-- transparency = true,
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "block",
		order = nil,
		modules = nil,
	},
	hl_override = {
		Normal = {
			-- bg = "#1E1E2E",
		},
		-- ["@namespace"] = { italic = true },
	},
}

return M
