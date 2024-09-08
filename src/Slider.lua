local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)
local Hooks = TS.import(script, TS.getModule(script, "@rbxts", "pretty-react-hooks").src)

local useTheme = require(script.Parent.useTheme)
local useDragInput = require(script.Parent.useDragInput)

local PADDING_BAR_SIDE = 3
local PADDING_REGION_TOP = 1
local PADDING_REGION_SIDE = 6

local defaultBackground = Hooks.new(React)(function(props, hooks)
	local theme = useTheme(hooks)
	local mainModifier = Enum.StudioStyleGuideModifier.Default
	if props.Disabled then
		mainModifier = Enum.StudioStyleGuideModifier.Disabled
	end
	return React.createElement("Frame", {
		BackgroundColor3 = theme:GetColor(Enum.StudioStyleGuideColor.InputFieldBackground, mainModifier),
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0,
	})
end)

local defaultProps = {
	Step = 0,
	Disabled = false,
	Background = defaultBackground,
}

local function Slider(props, hooks)
	local theme = useTheme(hooks)

	local regionRef = hooks.useValue(React.createRef())

	local drag = useDragInput(hooks, function(_, position)
		local range = props.Max - props.Min
		local region = regionRef.value:getValue()
		local offset = position.x - region.AbsolutePosition.x
		local alpha = offset / region.AbsoluteSize.x

		local value = range * alpha
		if props.Step > 0 then
			value = math.round(value / props.Step) * props.Step
		end
		value = math.clamp(value, 0, range) + props.Min

		if value ~= props.Value then
			props.OnChange(value)
		end
	end)

	hooks.useEffect(function()
		if props.Disabled then
			drag.cancel()
		end
	end, { props.Disabled })

	local range = props.Max - props.Min
	local alpha = (props.Value - props.Min) / range

	local handleModifier = Enum.StudioStyleGuideModifier.Default
	if props.Disabled then
		handleModifier = Enum.StudioStyleGuideModifier.Disabled
	elseif drag.hovered or drag.active then
		handleModifier = Enum.StudioStyleGuideModifier.Hover
	end

	-- used to create a blended border color when slider is disabled
	local handleFill = theme:GetColor(Enum.StudioStyleGuideColor.Button, handleModifier)
	local handleBorder = theme:GetColor(Enum.StudioStyleGuideColor.Border, handleModifier)

	-- if we use a Frame here, the 2d studio selection rectangle will appear when dragging
	-- we could prevent that using Active = true, but that displays the Click cursor
	-- ... the best workaround is a TextButton with Active = false
	return React.createElement("TextButton", {
		Text = "",
		Active = false,
		AutoButtonColor = false,
		Size = props.Size or UDim2.new(1, 0, 0, 22),
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex,
		BackgroundTransparency = 1,
		[React.Event.InputBegan] = if not props.Disabled then drag.onInputBegan else nil,
		[React.Event.InputEnded] = if not props.Disabled then drag.onInputEnded else nil,
	}, {
		BackgroundHolder = React.createElement("Frame", {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
		}, {
			Background = React.createElement(props.Background, {
				Disabled = props.Disabled,
				Hover = drag.hovered,
				Dragging = drag.active,
				Value = props.Value,
			}),
		}),
		Bar = React.createElement("Frame", {
			ZIndex = 1,
			Position = UDim2.fromOffset(PADDING_BAR_SIDE, 10),
			Size = UDim2.new(1, -PADDING_BAR_SIDE * 2, 0, 2),
			BorderSizePixel = 0,
			BackgroundTransparency = props.Disabled and 0.4 or 0,
			BackgroundColor3 = theme:GetColor(
				-- this looks odd but provides the correct colors for both themes
				Enum.StudioStyleGuideColor.TitlebarText,
				Enum.StudioStyleGuideModifier.Disabled
			),
		}),
		HandleRegion = React.createElement("Frame", {
			ZIndex = 2,
			Position = UDim2.fromOffset(PADDING_REGION_SIDE, PADDING_REGION_TOP),
			Size = UDim2.new(1, -PADDING_REGION_SIDE * 2, 1, -PADDING_REGION_TOP * 2),
			BackgroundTransparency = 1,
			[React.Ref] = regionRef.value,
		}, {
			Handle = React.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(alpha, 0),
				Size = UDim2.new(0, 10, 1, 0),
				BorderMode = Enum.BorderMode.Inset,
				BorderSizePixel = 1,
				BorderColor3 = handleBorder:Lerp(handleFill, props.Disabled and 0.5 or 0),
				BackgroundColor3 = handleFill,
			}),
		}),
	})
end

return Hooks.new(React)(Slider, {
	defaultProps = defaultProps,
})
