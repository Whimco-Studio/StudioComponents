import { Element } from "@rbxts/roact";
import { IBaseButtonProps } from "BaseButton";
import { PartialBy } from "UtilityTypes";

type IMainButtonProps = PartialBy<
    IBaseButtonProps,
    "TextColorStyle" | "BackgroundColorStyle" | "BorderColorStyle"
>;

export const MainButton: (props: IMainButtonProps) => Element;
