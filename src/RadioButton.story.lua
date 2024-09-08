local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local RadioButton = require(script.Parent.RadioButton)

local Wrapper = React.Component:extend("Wrapper")

function Wrapper:init()
	self:setState({
		Selected = 1,
	})
end

function Wrapper:render()
	local count = 3

	local buttons = {}
	for i = 1, count do
		buttons[i] = React.createElement(RadioButton, {
			LayoutOrder = i,
			Value = self.state.Selected == i,
			Label = "Button" .. tostring(i),
			Disabled = i == count,
			OnActivated = function()
				self:setState({ Selected = i })
			end,
		})
	end

	return React.createFragment({
		Layout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		Buttons = React.createFragment(buttons),
	})
end

return function(target)
	local element = React.createElement(Wrapper)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
