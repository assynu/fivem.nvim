# A Neovim Plugin For Fivem Developers
Inspired by [vscode fivem plugin](https://github.com/overextended/cfxlua-vscode)

## Informations
This plugin enhances the **FiveM** (and potentially **RedM**) development experience in Neovim. It provides full
autocompletion for all game natives and recognizes essential **CitizenFX runtime functions**, such as the `Citizen` table
for creating threads and the built-in `json` library for serialization. It also correctly interprets FiveM's custom
Lua syntax, including safe navigation operators (`foo?.bar`) and compound assignments (`foo += bar`), to eliminate
false errors. This allows you to write modern, clean code without editor noise, focusing solely on your logic.

## Documentation

### Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
    "assynu/fivem.nvim",

    dependencies = {
        "neovim/nvim-lspconfig",
    },
    event = "BufReadPre *.lua",

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
