local M = {}

local function get_plugin_root()
	local info = debug.getinfo(1, "S")
	if info and info.source and info.source:sub(1, 1) == "@" then
		local path = info.source:sub(2)
		return vim.fn.fnamemodify(path, ":h:h:h")
	end
	return nil
end

function M.setup(opts)
	local function find_fxmanifest_root()
		local current_buf_path = vim.api.nvim_buf_get_name(0)
		if not current_buf_path or current_buf_path == "" then
			return nil
		end
		local dir = vim.fn.fnamemodify(current_buf_path, ":h")
		return vim.fn.finddir("fxmanifest.lua", dir .. ";")
	end

	if not find_fxmanifest_root() then
		return
	end

	local plugin_root = get_plugin_root()
	if not plugin_root then
		vim.notify("Could not determine fivem.nvim plugin root path.", vim.log.levels.ERROR)
		return
	end

	opts = opts or {}
	local default_globals = {
		"vim",
	}

	if opts.globals then
		for _, global in ipairs(opts.globals) do
			table.insert(default_globals, global)
		end
	end

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local lsp_settings = {
		capabilities = capabilities,
		root_markers = {
			"fxmanifest.lua",
			".git",
		},
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
				runtime = {
					version = "Lua 5.4",
					nonstandardSymbol = { "/**/", "`", "+=", "-=", "*=", "/=", "<<=", ">>=", "&=", "|=", "^=" },
					special = {
						["lib.load"] = "require",
					},
					pathStrict = true,
					plugin = plugin_root .. "/lua/lls-plugin/fivem.lua",
				},
				diagnostics = {
					globals = default_globals,
				},
				workspace = {
					trustedFolders = { plugin_root },
					ignoreDir = { ".vscode", ".git", ".github", "dist", "stream", "node_modules", "web" },
					library = {
						plugin_root .. "/lua/library",
					},
				},
			},
		},
	}

	vim.lsp.config("lua_ls", lsp_settings)
end

return M
