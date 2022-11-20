import { Element } from "@rbxts/roact"

type IMainButtonProps = {
    Disabled?: boolean;
    Selected?: boolean;
    TextColorStyle?: Enum.StudioStyleGuideColor;
    BackgroundColorStyle?: Enum.StudioStyleGuideColor;
    BorderColorStyle?: Enum.StudioStyleGuideColor;
    OnActivated: () => void;
} & Partial<WritableProperties<TextButton>>

export const MainButton: (props: IMainButtonProps) => Element