local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Slider = require(script.Parent.Slider)
local Checkbox = require(script.Parent.Checkbox)

local Constants = require(script.Parent.Constants)

local MIN = 0
local MAX = 10
local STEP = 1
local INIT = 3

local Wrapper = React.Component:extend("Wrapper")

function Wrapper:init()
	self:setState({ Disabled = false, Value = INIT })
end

function Wrapper.renderCustomBackground(props)
	return React.createElement("Frame", {
		BackgroundColor3 = Color3.fromHSV(210 / 360, props.Value / 10, if props.Disabled then 0.25 else 0.8),
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0,
	})
end

function Wrapper:render()
	return React.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(0, 100, 1, 0),
		BackgroundTransparency = 1,
	}, {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
		}),
		Slider0 = React.createElement(Slider, {
			Min = MIN,
			Max = MAX,
			Step = STEP,
			Value = self.state.Value,
			Disabled = self.state.Disabled,
			OnChange = function(newValue)
				self:setState({ Value = newValue })
			end,
			LayoutOrder = 0,
		}),
		Slider1 = React.createElement(Slider, {
			Min = MIN,
			Max = MAX,
			Step = STEP,
			Background = self.renderCustomBackground,
			Disabled = self.state.Disabled,
			Value = self.state.Value,
			OnChange = function(newValue)
				self:setState({ Value = newValue })
			end,
			LayoutOrder = 1,
		}),
		Disabled = React.createElement(Checkbox, {
			Value = self.state.Disabled,
			Label = "Disabled",
			Alignment = Constants.CheckboxAlignment.Left,
			OnActivated = function()
				self:setState({ Disabled = not self.state.Disabled })
			end,
			LayoutOrder = 2,
		}),
	})
end

return function(target)
	local element = React.createElement(Wrapper)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
