import { Element } from "@rbxts/react";

type IColorPickerProps = {
    Color: Color3;
    OnChange: (color: Color3) => void;
} & Partial<Pick<Frame, "Size" | "Position" | "AnchorPoint">>;

export const ColorPicker: (props: IColorPickerProps) => Element;
