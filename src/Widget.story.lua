local Packages = script.Parent.Parent
local React = require(Packages.Roact)

local Button = require(script.Parent.Button)
local Widget = require(script.Parent.Widget)

local Wrapper = React.Component:extend("Wrapper")

function Wrapper:init()
	self:setState({
		Enabled = false,
	})
end

function Wrapper:render()
	return React.createFragment({
		Button = React.createElement(Button, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(120, 30),
			Text = self.state.Enabled and "Close Widget" or "Open Widget",
			OnActivated = function()
				self:setState({ Enabled = not self.state.Enabled })
			end,
		}),
		Widget = self.state.Enabled and React.createElement(Widget, {
			Id = "_unique101",
			OnClosed = function()
				self:setState({ Enabled = false })
			end,
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
