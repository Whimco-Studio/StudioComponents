local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rbxts_include = ReplicatedStorage:FindFirstChild("rbxts_include")
if not rbxts_include then
	rbxts_include = script:FindFirstAncestor("node_modules").Parent
end
local TS = require(rbxts_include.RuntimeLib)

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local joinDictionaries = require(script.Parent.joinDictionaries)
local BaseButton = require(script.Parent.BaseButton)

local function Button(props)
	return Roact.createElement(
		BaseButton,
		joinDictionaries({
			TextColorStyle = Enum.StudioStyleGuideColor.ButtonText,
			BackgroundColorStyle = Enum.StudioStyleGuideColor.Button,
			BorderColorStyle = Enum.StudioStyleGuideColor.ButtonBorder,
		}, props)
	)
end

return Button
