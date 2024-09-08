local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local joinDictionaries = require(script.Parent.joinDictionaries)
local withTheme = require(script.Parent.withTheme)

local Constants = require(script.Parent.Constants)
local TextInput = React.Component:extend("TextInput")

local PLACEHOLDER_TEXT_COLOR = Color3.fromRGB(102, 102, 102) -- works for both themes

local noop = function() end

TextInput.defaultProps = {
	Size = UDim2.new(1, 0, 0, 21),
	LayoutOrder = 0,
	Disabled = false,
	Text = "",
	PlaceholderText = "",
	ClearTextOnFocus = true,
	OnFocused = noop,
	OnFocusLost = noop,
	OnChanged = noop,
}

function TextInput:init()
	self:setState({
		Hover = false,
		Focused = false,
	})
	self.onInputBegan = function(_, inputObject)
		if self.props.Disabled then
			return
		elseif inputObject.UserInputType == Enum.UserInputType.MouseMovement then
			self:setState({ Hover = true })
		end
	end
	self.onInputEnded = function(_, inputObject)
		if self.props.Disabled then
			return
		elseif inputObject.UserInputType == Enum.UserInputType.MouseMovement then
			self:setState({ Hover = false })
		end
	end
	self.onFocused = function()
		self:setState({ Focused = true })
		self.props.OnFocused()
	end
	self.onFocusLost = function(rbx, enterPressed, inputObject)
		self:setState({ Focused = false })
		self.props.OnFocusLost(rbx.Text, enterPressed, inputObject)
	end
	self.onChanged = function(rbx)
		self.props.OnChanged(rbx.Text)
	end
end

function TextInput:render()
	local padding = React.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 5),
		PaddingRight = UDim.new(0, 5),
	})
	local mainModifier = Enum.StudioStyleGuideModifier.Default
	local borderModifier = Enum.StudioStyleGuideModifier.Default
	if self.props.Disabled then
		mainModifier = Enum.StudioStyleGuideModifier.Disabled
		borderModifier = Enum.StudioStyleGuideModifier.Disabled
	elseif self.state.Focused then
		borderModifier = Enum.StudioStyleGuideModifier.Selected
	elseif self.state.Hover then
		borderModifier = Enum.StudioStyleGuideModifier.Hover
	end
	return withTheme(function(theme)
		local textFieldProps = {
			Size = self.props.Size,
			Position = self.props.Position,
			BackgroundColor3 = theme:GetColor(Enum.StudioStyleGuideColor.InputFieldBackground, mainModifier),
			BorderColor3 = theme:GetColor(Enum.StudioStyleGuideColor.InputFieldBorder, borderModifier),
			BorderMode = Enum.BorderMode.Inset,
			LayoutOrder = self.props.LayoutOrder,
			Font = Constants.Font,
			Text = self.props.Text,
			TextSize = Constants.TextSize,
			TextColor3 = theme:GetColor(Enum.StudioStyleGuideColor.MainText, mainModifier),
			TextXAlignment = Enum.TextXAlignment.Left,
		}
		return self.props.Disabled and React.createElement("TextLabel", textFieldProps, { Padding = padding })
			or React.createElement(
				"TextBox",
				joinDictionaries(textFieldProps, {
					AnchorPoint = self.props.AnchorPoint,
					PlaceholderText = self.props.PlaceholderText,
					PlaceholderColor3 = PLACEHOLDER_TEXT_COLOR,
					ClearTextOnFocus = self.props.ClearTextOnFocus,
					[React.Event.Focused] = self.onFocused,
					[React.Event.FocusLost] = self.onFocusLost,
					[React.Event.InputBegan] = self.onInputBegan,
					[React.Event.InputEnded] = self.onInputEnded,
					[React.Change.Text] = self.onChanged,
				}),
				{
					Padding = padding,
				}
			)
	end)
end

return TextInput
