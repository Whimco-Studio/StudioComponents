import { Element } from "@rbxts/roact";

type IButtonProps = {
  Disabled?: boolean;
  Selected?: boolean;
  TextColorStyle?: Enum.StudioStyleGuideColor;
  BackgroundColorStyle?: Enum.StudioStyleGuideColor;
  BorderColorStyle?: Enum.StudioStyleGuideColor;
  OnActivated: () => void;
} & Partial<WritableProperties<TextButton>>;

export const Button: (props: IButtonProps) => Element;
