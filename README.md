# A Neovim Plugin For Fivem Developers
Inspired by [vscode fivem plugin](https://github.com/overextended/cfxlua-vscode)

## Informations
This plugin enhances the **FiveM** (and potentially **RedM**) development experience in Neovim. It provides full
autocompletion for all game natives and recognizes essential **CitizenFX runtime functions**, such as the `Citizen` table
for creating threads and the built-in `json` library for serialization. It also correctly interprets FiveM's custom
Lua syntax, including safe navigation operators (`foo?.bar`) and compound assignments (`foo += bar`), to eliminate
false errors. This allows you to write modern, clean code without editor noise, focusing solely on your logic.

> **Note:** This plugin requires **lua_ls** (Lua Language Server). Make sure it is installed and configured properly in your Neovim setup.

## Documentation

### Installation

Using [default package manager](https://neovim.io/doc/user/pack.html) (Requires Neovim 0.12)
```lua
-- Somewhere before it there should be
-- vim.pack.add("https://github.com/neovim/nvim-lspconfig")
vim.pack.add("https://github.com/assynu/fivem.nvim.git")

require("fivem-nvim").setup({})

-- Or with custom parameters

require("fivem-nvim").setup({
	globals = {
		"lib",
		"cache",
		"Core",
		"MySQL",
	},
})
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
    "assynu/fivem.nvim",

    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require("fivem-nvim").setup(opts)
    end,
}
```

### Optional parameters

*Custom global values*
```lua
return {
    "assynu/fivem.nvim",

    dependencies = {
        "neovim/nvim-lspconfig",
    },
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

## Contributing

If you're interested in adding features, improving functionality, or making internal adjustments — **feel free to open a Pull Request**.  
For bugs, issues, or proposals, please report them through the **GitHub Issues** section so I can address them.

## Disclaimer

This plugin was originally created for my personal configuration, and later adapted into a public plugin.  
Because of that, the documentation and requirements may not yet be perfect.  
If you encounter any missing pieces, incorrect behavior, or unclear setup steps, **please let me know** so I can fix and improve it.
