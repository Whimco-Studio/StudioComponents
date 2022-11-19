local HttpService = game:GetService("HttpService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rbxts_include = ReplicatedStorage:FindFirstChild("rbxts_include")
if not rbxts_include then
	rbxts_include = script:FindFirstAncestor("node_modules").Parent
end
local TS = require(rbxts_include.RuntimeLib)

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "roact-hooks").src)

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

	return Roact.createElement(PluginContext.Provider, {
		value = {
			plugin = plugin,
			pushMouseIcon = pushMouseIcon,
			popMouseIcon = popMouseIcon,
		},
	}, props[Roact.Children])
end

return Hooks.new(Roact)(PluginProvider)
