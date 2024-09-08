local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local TabContainer = require(script.Parent.TabContainer)

local Label = require(script.Parent.Label)
local Button = require(script.Parent.Button)
local TextInput = require(script.Parent.TextInput)

local function Centered(props)
	return React.createFragment({
		Layout = React.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		Child = React.oneChild(props[React.Children]),
	})
end

local Wrapper = React.Component:extend("Wrapper")

function Wrapper:init()
	self:setState({
		SelectedTab = "Label",
	})
end

function Wrapper:render()
	return React.createElement(TabContainer, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, -100, 1, -150),
		Tabs = {
			{
				Name = "Label",
				Content = React.createElement(Centered, {}, {
					Label = React.createElement(Label, {
						Text = "Label",
					}),
				}),
			},
			{
				Name = "Button",
				Content = React.createElement(Centered, {}, {
					Button = React.createElement(Button, {
						Size = UDim2.fromOffset(100, 30),
						Text = "Button",
						OnActivated = function() end,
					}),
				}),
			},
			{
				Name = "TextInput",
				Content = React.createElement(Centered, {}, {
					TextInput = React.createElement(TextInput, {
						Size = UDim2.fromOffset(100, 21),
						OnChanged = function() end,
						PlaceholderText = "Placeholder",
					}),
				}),
			},
			{
				Name = "Disabled",
				Disabled = true,
			},
		},
		SelectedTab = self.state.SelectedTab,
		OnTabSelected = function(tab)
			self:setState({ SelectedTab = tab })
		end,
	})
end

return function(target)
	local element = React.createElement(Wrapper)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
