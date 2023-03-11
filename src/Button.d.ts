import { Element } from "@rbxts/roact";
import { IBaseButtonProps } from "BaseButton";
import { PartialBy } from "UtilityTypes";

type IButtonProps = PartialBy<
    IBaseButtonProps,
    "TextColorStyle" | "BackgroundColorStyle" | "BorderColorStyle"
>;

export const Button: (props: IButtonProps) => Element;
