local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Label = require(script.Parent.Label)
local Checkbox = require(script.Parent.Checkbox)
local ScrollFrame = require(script.Parent.ScrollFrame)

local numRows = 16
local numCols = 16

local size = Vector2.new(48, 32)
local fmt = "%i,%i"

local function Row(props)
	local children = {}
	for i = 1, numCols do
		children[i] = React.createElement(Label, {
			LayoutOrder = i,
			Text = string.format(fmt, i - 1, props.Row - 1),
			Size = UDim2.new(0, size.x, 1, 0),
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromHSV((i + props.Row) % 4 * 0.25, 0.7, 0.6),
		})
	end
	return React.createElement("Frame", {
		LayoutOrder = props.Row,
		Size = UDim2.fromOffset(numCols * size.x, size.y),
		BackgroundTransparency = 1,
	}, {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
		Children = React.createFragment(children),
	})
end

local Wrapper = React.Component:extend("ScrollFrameWrapper")

function Wrapper:init()
	self:setState({
		ModeX = true,
		ModeY = true,
		Enabled = true,
	})
end

function Wrapper:render()
	local rows = {}
	for i = 1, numRows do
		rows[i] = React.createElement(Row, { Row = i })
	end

	local mode = Enum.ScrollingDirection.XY
	if not self.state.ModeX then
		mode = Enum.ScrollingDirection.Y
	elseif not self.state.ModeY then
		mode = Enum.ScrollingDirection.X
	end

	return React.createElement("Frame", {
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1,
	}, {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 5),
		}),
		CheckboxEnabled = React.createElement(Checkbox, {
			LayoutOrder = 0,
			Value = self.state.Enabled,
			Label = "Enabled",
			OnActivated = function()
				self:setState({ Enabled = not self.state.Enabled })
			end,
		}),
		CheckboxX = React.createElement(Checkbox, {
			LayoutOrder = 1,
			Value = self.state.ModeX,
			Label = "X Direction",
			OnActivated = function()
				local nextX = not self.state.ModeX
				local nextY = self.state.ModeY
				if nextX == false and nextY == false then
					nextY = true
				end
				self:setState({
					ModeX = nextX,
					ModeY = nextY,
				})
			end,
		}),
		CheckboxY = React.createElement(Checkbox, {
			LayoutOrder = 2,
			Value = self.state.ModeY,
			Label = "Y Direction",
			OnActivated = function()
				local nextY = not self.state.ModeY
				local nextX = self.state.ModeX
				if nextY == false and nextX == false then
					nextX = true
				end
				self:setState({
					ModeX = nextX,
					ModeY = nextY,
				})
			end,
		}),
		Main = mode and React.createElement(ScrollFrame, {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 240),
			ScrollingDirection = mode,
			Disabled = not self.state.Enabled,
		}, rows),
	})
end

return function(target)
	local element = React.createElement(Wrapper)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end
