---@param uri string
---@param text string
---@return { start: integer, finish: integer, text: string }[] | string | nil
function OnSetText(uri, text)
	if string.find(uri, "[\\/]%.vscode[\\/]") or string.sub(text, 1, 8) == "---@meta" then
		return
	end

	if string.sub(text, 1, 4) == "FXAP" then
		return ""
	end

	local diffs = {}
	local count = 0

	if string.find(uri, "fxmanifest%.lua$") then
		count = count + 1
		diffs[count] = {
			start = 1,
			finish = 0,
			text = "---@diagnostic disable: undefined-global\n",
		}
	end

	for safeNav in string.gmatch(text, "()%?[%.%[]+") do
		count = count + 1
		diffs[count] = {
			start = safeNav,
			finish = safeNav,
			text = "",
		}
	end

	for pre, whitespace, tableStart, tableName, tableEnd in string.gmatch(text, "([=,;%s%(%)])([%s]*)()([_%w%.%[%]]-)()%?[%[%.]") do
		count = count + 1
		diffs[count] = {
			start = tableStart - 1,
			finish = tableEnd - 1,
			text = ("%s(%s or {})"):format(whitespace == "" and pre or "", tableName),
		}
	end

	return diffs
end
