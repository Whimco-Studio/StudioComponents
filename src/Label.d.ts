import { Element } from "@rbxts/react";

type ILabelProps = {
    Disabled?: boolean;
    TextColorStyle?: Enum.StudioStyleGuideColor;
} & Partial<Omit<WritableInstanceProperties<TextLabel>, "TextColor3">>;

export const Label: (props: ILabelProps) => Element;
