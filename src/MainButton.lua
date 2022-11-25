local TS = _G[script.Parent]

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local joinDictionaries = require(script.Parent.joinDictionaries)
local BaseButton = require(script.Parent.BaseButton)

local function MainButton(props)
	return Roact.createElement(
		BaseButton,
		joinDictionaries({
			TextColorStyle = Enum.StudioStyleGuideColor.DialogMainButtonText,
			BackgroundColorStyle = Enum.StudioStyleGuideColor.DialogMainButton,
			BorderColorStyle = Enum.StudioStyleGuideColor.ButtonBorder,
		}, props)
	)
end

return MainButton
