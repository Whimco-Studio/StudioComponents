local Packages = script.Parent.Parent
local React = require(Packages.Roact)

local Label = require(script.Parent.Label)
local VerticalCollapsibleSection = require(script.Parent.VerticalCollapsibleSection)

local Wrapper = React.Component:extend("VerticalCollapsibleSectionWrapper")

function Wrapper:init()
	self:setState({
		Collapsed = false,
	})
end

function Wrapper:render()
	local children = {}
	for i = 1, 5 do
		children[i] = React.createElement(Label, {
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, 24),
			Text = string.format("Entry%i", i),
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromHSV(0, 0, 0.2 - (i % 2) * 0.02),
			TextXAlignment = Enum.TextXAlignment.Left,
		}, {
			Padding = React.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
			}),
		})
	end
	return React.createElement(VerticalCollapsibleSection, {
		HeaderText = "Header",
		Collapsed = self.state.Collapsed,
		OnToggled = function()
			self:setState({
				Collapsed = not self.state.Collapsed,
			})
		end,
	}, children)
end

return function(target)
	local element = React.createElement(Wrapper)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
