local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Checkbox = require(script.Parent.Checkbox)
local Constants = require(script.Parent.Constants)

local Wrapper = React.Component:extend("CheckboxWrapper")

function Wrapper:init()
	self:setState({
		Value0 = true,
		Value1 = false,
	})
end

function Wrapper:render()
	local state = self.state
	local value2 = Constants.CheckboxIndeterminate
	if state.Value0 == state.Value1 then
		value2 = state.Value0
	end
	return React.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(0, 200, 1, 0),
		BackgroundTransparency = 1,
	}, {
		Layout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		Checkbox0 = React.createElement(Checkbox, {
			LayoutOrder = 0,
			Value = state.Value0,
			Label = "Value0",
			OnActivated = function()
				self:setState({ Value0 = not state.Value0 })
			end,
		}),
		Checkbox1 = React.createElement(Checkbox, {
			LayoutOrder = 1,
			Value = state.Value1,
			Label = "Value1",
			OnActivated = function()
				self:setState({ Value1 = not state.Value1 })
			end,
		}),
		Checkbox2 = React.createElement(Checkbox, {
			LayoutOrder = 2,
			Value = value2,
			Label = "Value0 & Value1",
			OnActivated = function()
				local nextValue = true
				if state.Value0 == state.Value1 then
					nextValue = not state.Value0
				end
				self:setState({
					Value0 = nextValue,
					Value1 = nextValue,
				})
			end,
		}),
		Padding = React.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 12),
			LayoutOrder = 3,
		}),
		Checkbox3 = React.createElement(Checkbox, {
			LayoutOrder = 4,
			Value = true,
			Disabled = true,
			Label = "Disabled, true",
		}),
		Checkbox4 = React.createElement(Checkbox, {
			LayoutOrder = 5,
			Value = false,
			Disabled = true,
			Label = "Disabled, false",
		}),
		Checkbox5 = React.createElement(Checkbox, {
			LayoutOrder = 6,
			Value = Constants.CheckboxIndeterminate,
			Disabled = true,
			Label = "Disabled, indeterminate",
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
