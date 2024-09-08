local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Label = require(script.Parent.Label)

local textColorItems = {}
for _, colorItem in ipairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
	local name = colorItem.Name
	if string.sub(name, -4) == "Text" then
		table.insert(textColorItems, colorItem)
	end
end

return function(target)
	local textElements = {}
	for i, colorItem in ipairs(textColorItems) do
		local name = colorItem.Name
		if colorItem == Enum.StudioStyleGuideColor.MainText then
			name ..= " (Default)"
		end
		textElements[i] = React.createElement(Label, {
			LayoutOrder = i,
			Size = UDim2.fromOffset(120, 16),
			Text = name,
			TextColorStyle = colorItem,
		})
	end
	local element = React.createFragment({
		Layout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		DisabledLabel = React.createElement(Label, {
			LayoutOrder = 0,
			Size = UDim2.fromOffset(120, 32),
			Text = "MainText (Disabled)",
			Disabled = true,
		}),
		TextElements = React.createFragment(textElements),
	})
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
