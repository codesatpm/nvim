require("nvchad.options")

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.g.toggle_theme_icon = ""
-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Numbers
o.relativenumber = true

-- Clipboard
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
