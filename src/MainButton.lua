local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local joinDictionaries = require(script.Parent.joinDictionaries)
local BaseButton = require(script.Parent.BaseButton)

local function MainButton(props)
	return React.createElement(
		BaseButton,
		joinDictionaries({
			TextColorStyle = Enum.StudioStyleGuideColor.DialogMainButtonText,
			BackgroundColorStyle = Enum.StudioStyleGuideColor.DialogMainButton,
			BorderColorStyle = Enum.StudioStyleGuideColor.ButtonBorder,
		}, props)
	)
end

return MainButton
