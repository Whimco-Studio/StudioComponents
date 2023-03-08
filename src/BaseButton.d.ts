import { Element } from "@rbxts/roact"

type IBaseButtonProps = {
    Disabled?: boolean;
    Selected?: boolean;
    TextColorStyle?: Enum.StudioStyleGuideColor;
    BackgroundColorStyle?: Enum.StudioStyleGuideColor;
    BorderColorStyle?: Enum.StudioStyleGuideColor;
    OnActivated: () => void;
} & Partial<WritableProperties<TextButton>>

export const BaseButton: (props: IBaseButtonProps) => Element