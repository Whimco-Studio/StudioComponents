local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "roact-hooks").src)

local useTheme = require(script.Parent.useTheme)
local joinDictionaries = require(script.Parent.joinDictionaries)

local Constants = require(script.Parent.Constants)

local defaultProps = {
	Size = UDim2.fromScale(1, 1),
	Text = "Label.defaultProps.Text",
	Font = Constants.Font,
	TextSize = Constants.TextSize,
	TextColorStyle = Enum.StudioStyleGuideColor.MainText,
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	BorderMode = Enum.BorderMode.Inset,
	Position = UDim2.fromScale(0.5, 0),
	AnchorPoint = Vector2.new(0.5, 0),
	-- BackColorStyle?
	-- BorderColorStyle?
}

local function Label(props, hooks)
	local theme = useTheme(hooks)

	local joinedProps = joinDictionaries(defaultProps, props)
	local modifier = Enum.StudioStyleGuideModifier.Default
	if joinedProps.Disabled then
		modifier = Enum.StudioStyleGuideModifier.Disabled
	end
	joinedProps.TextColor3 = theme:GetColor(joinedProps.TextColorStyle, modifier)
	joinedProps.Disabled = nil
	joinedProps.TextColorStyle = nil

	return React.createElement("TextLabel", joinedProps)
end

return Hooks.new(React)(Label, {
	defaultProps = defaultProps,
})
