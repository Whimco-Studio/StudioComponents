local Packages = script.Parent.Parent
local React = require(Packages.Roact)

local TextInput = require(script.Parent.TextInput)

return function(target)
	local element = React.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.7, 0.7),
		BackgroundTransparency = 1,
	}, {
		Layout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		Input0 = React.createElement(TextInput, {
			LayoutOrder = 0,
			PlaceholderText = "Enabled",
		}),
		TextInput1 = React.createElement(TextInput, {
			LayoutOrder = 1,
			Disabled = true,
			PlaceholderText = "Disabled",
			Text = "Disabled",
		}),
	})
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
