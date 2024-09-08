local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "roact-hooks").src)

local joinDictionaries = require(script.Parent.joinDictionaries)
local useTheme = require(script.Parent.useTheme)

local Constants = require(script.Parent.Constants)

local defaultProps = {
	LayoutOrder = 0,
	Disabled = false,
	Selected = false,
	Position = UDim2.fromScale(0, 0),
	AnchorPoint = Vector2.new(0, 0),
	Size = UDim2.fromScale(1, 1),
	Text = "Button.defaultProps.Text",
	TextColorStyle = Enum.StudioStyleGuideColor.ButtonText,
	BackgroundColorStyle = Enum.StudioStyleGuideColor.Button,
	BorderColorStyle = Enum.StudioStyleGuideColor.ButtonBorder,
	OnActivated = function() end,
}

local propsToScrub = {
	Disabled = React.None,
	Selected = React.None,
	TextColorStyle = React.None,
	BackgroundColorStyle = React.None,
	BorderColorStyle = React.None,
	OnActivated = React.None,
}

local function BaseButton(props, hooks)
	local theme = useTheme(hooks)

	local hovered, setHovered = hooks.useState(false)
	local pressed, setPressed = hooks.useState(false)

	local onInputBegan = function(_, inputObject)
		if props.Disabled then
			return
		elseif inputObject.UserInputType == Enum.UserInputType.MouseMovement then
			setHovered(true)
		elseif inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			setPressed(true)
		end
	end

	local onInputEnded = function(_, inputObject)
		if props.Disabled then
			return
		elseif inputObject.UserInputType == Enum.UserInputType.MouseMovement then
			setHovered(false)
		elseif inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			setPressed(false)
		end
	end

	local onActivated = function()
		if not props.Disabled then
			setHovered(false)
			setPressed(false)
			props.OnActivated()
		end
	end

	local modifier = Enum.StudioStyleGuideModifier.Default
	if props.Disabled then
		modifier = Enum.StudioStyleGuideModifier.Disabled
	elseif props.Selected then
		modifier = Enum.StudioStyleGuideModifier.Selected
	elseif pressed then
		modifier = Enum.StudioStyleGuideModifier.Pressed
	elseif hovered then
		modifier = Enum.StudioStyleGuideModifier.Hover
	end

	local scrubbedProps = joinDictionaries(props, propsToScrub, {
		Font = Constants.Font,
		TextSize = Constants.TextSize,
		TextColor3 = theme:GetColor(props.TextColorStyle, modifier),
		BackgroundColor3 = theme:GetColor(props.BackgroundColorStyle, modifier),
		BorderColor3 = theme:GetColor(props.BorderColorStyle, modifier),
		BorderMode = Enum.BorderMode.Inset,
		AutoButtonColor = false,
		[React.Event.InputBegan] = onInputBegan,
		[React.Event.InputEnded] = onInputEnded,
		[React.Event.Activated] = onActivated,
	})

	return React.createElement("TextButton", scrubbedProps)
end

return Hooks.new(React)(BaseButton, {
	defaultProps = defaultProps,
})
