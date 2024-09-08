local TS = _G[script.Parent.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "pretty-react-hooks").src)

local Constants = require(script.Parent.Parent.Constants)
local useTheme = require(script.Parent.Parent.useTheme)

local function DropdownItem(props, hooks)
	local theme = useTheme(hooks)
	local hovered, setHovered = hooks.useState(false)

	local onInputBegan = function(_rbx, input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			setHovered(true)
		end
	end

	local onInputEnded = function(_rbx, input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			setHovered(false)
		end
	end

	local modifier = Enum.StudioStyleGuideModifier.Default
	if hovered then
		modifier = Enum.StudioStyleGuideModifier.Hover
	end

	return React.createElement("TextButton", {
		AutoButtonColor = false,
		LayoutOrder = props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, props.RowHeightItem),
		BackgroundColor3 = theme:GetColor(Enum.StudioStyleGuideColor.EmulatorBar, modifier),
		BorderSizePixel = 0,
		Text = props.Item,
		Font = Constants.Font,
		TextSize = Constants.TextSize,
		TextColor3 = theme:GetColor(Enum.StudioStyleGuideColor.MainText, modifier),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		[React.Event.InputBegan] = onInputBegan,
		[React.Event.InputEnded] = onInputEnded,
		[React.Event.Activated] = function()
			props.OnSelected(props.Item)
		end,
	}, {
		Padding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, props.TextPaddingLeft - 1),
			PaddingRight = UDim.new(0, props.TextPaddingRight),
		}),
	})
end

return Hooks.new(React)(DropdownItem)
