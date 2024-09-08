local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Button = require(script.Parent.Button)

return function(target)
	local element = React.createFragment({
		Layout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		Button0 = React.createElement(Button, {
			LayoutOrder = 0,
			Size = UDim2.fromOffset(100, 32),
			Text = "Enabled",
			OnActivated = function() end,
		}),
		Button1 = React.createElement(Button, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(100, 32),
			Text = "Selected",
			Selected = true,
			OnActivated = function() end,
		}),
		Button2 = React.createElement(Button, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(100, 32),
			Text = "Disabled",
			Disabled = true,
		}),
	})
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
