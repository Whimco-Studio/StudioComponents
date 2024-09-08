local HttpService = game:GetService("HttpService")

local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "pretty-react-hooks").src)

local PluginContext = require(script.Parent.PluginContext)

-- consumers that set mouse icon are responsible for unsetting on unmount

local function PluginProvider(props, hooks)
	local plugin = props.Plugin
	local iconStack = hooks.useValue({})

	local function updateMouseIcon()
		local top = iconStack.value[#iconStack.value]
		plugin:GetMouse().Icon = if top then top.icon else ""
	end

	local function pushMouseIcon(icon)
		local id = HttpService:GenerateGUID(false)
		table.insert(iconStack.value, { id = id, icon = icon })
		updateMouseIcon()
		return id
	end

	local function popMouseIcon(id)
		for i = #iconStack.value, 1, -1 do
			local item = iconStack.value[i]
			if item.id == id then
				table.remove(iconStack.value, i)
			end
		end
		updateMouseIcon()
	end

	return React.createElement(PluginContext.Provider, {
		value = {
			plugin = plugin,
			pushMouseIcon = pushMouseIcon,
			popMouseIcon = popMouseIcon,
		},
	}, props[React.Children])
end

return Hooks.new(React)(PluginProvider)
