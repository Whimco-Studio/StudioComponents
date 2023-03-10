import { Element } from "@rbxts/roact";

type ILabelProps = {
  Disabled?: boolean;
  TextColorStyle?: Enum.StudioStyleGuideColor;
} & Partial<WritableProperties<TextLabel>>;

export const Label: (props: ILabelProps) => Element;
