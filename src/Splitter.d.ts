import { Element } from "@rbxts/roact";

type ISplitterProps<T> = {
    Alpha: number;
    OnAlphaChanged: (alpha: number) => void;
    Disabled?: boolean;
    Size?: UDim2;
    MinAlpha?: number;
    MaxAlpha?: number;
    Orientation?: "Horizontal" | "Vertical";
} & Partial<
    Pick<Frame, "Size" | "Position" | "AnchorPoint" | "ZIndex" | "LayoutOrder">
>;

/** **Note: Needs two child elements.** */
export const Splitter: <T>(props: ISplitterProps<T>) => Element;
