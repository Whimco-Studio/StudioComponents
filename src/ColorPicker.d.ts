import { Element } from "@rbxts/roact";

type IColorPickerProps = {
  Color: Color3;
  OnColorChanged: (color: Color3) => void;
} & Partial<WritableProperties<Frame>>;

export const ColorPicker: (props: IColorPickerProps) => Element;
