import { Element } from "@rbxts/roact";

type IBaseButtonProps = Partial<
  {
    Disabled: boolean;
    Selected: boolean;
    TextColorStyle: Enum.StudioStyleGuideColor;
    BackgroundColorStyle: Enum.StudioStyleGuideColor;
    BorderColorStyle: Enum.StudioStyleGuideColor;
    OnActivated: () => void;
  } & Omit<
    WritableInstanceProperties<TextButton>,
    | "Font"
    | "TextSize"
    | "TextColor3"
    | "BackgroundColor3"
    | "BorderColor3"
    | "BorderMode"
    | "AutoButtonColor"
  >
>;

export const BaseButton: (props: IBaseButtonProps) => Element;
