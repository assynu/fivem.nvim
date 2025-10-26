# A Neovim Plugin For Fivem Developers
Inspired by [vscode fivem plugin](https://github.com/overextended/cfxlua-vscode)

### Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
	dir = "~/code/fivem.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	event = "BufReadPre *.lua",
	opts = {
		globals = {
			"lib",
			"cache",
			"Core",
			"MySQL",
		},
	},
	config = function(_, opts)
		require("fivem-nvim").setup(opts)
	end,
}
```
