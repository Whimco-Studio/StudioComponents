local Packages = script.Parent.Parent
local React = require(Packages.Roact)

local Button = require(script.Parent.Button)
local Label = require(script.Parent.Label)
local VerticalExpandingList = require(script.Parent.VerticalExpandingList)

local Wrapper = React.Component:extend("VerticalExpandingListWrapper")

function Wrapper:init()
	self:setState({
		Count = 1,
	})
end

function Wrapper:render()
	local children = {}
	for i = 1, self.state.Count do
		children[i] = React.createElement(Label, {
			LayoutOrder = i,
			Size = UDim2.new(1, 0, 0, 32),
			Text = string.format("Label%i", i),
		})
	end
	return React.createFragment({
		Layout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5),
		}),
		ButtonRemove = React.createElement(Button, {
			LayoutOrder = 0,
			Text = "Remove Child",
			Size = UDim2.fromOffset(120, 30),
			Disabled = self.state.Count <= 0,
			OnActivated = function()
				self:setState({
					Count = math.max(0, self.state.Count - 1),
				})
			end,
		}),
		ExpandingList = React.createElement(VerticalExpandingList, {
			LayoutOrder = 1,
		}, children),
		ButtonAdd = React.createElement(Button, {
			LayoutOrder = 2,
			Text = "Add Child",
			Size = UDim2.fromOffset(120, 30),
			OnActivated = function()
				self:setState({
					Count = self.state.Count + 1,
				})
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
