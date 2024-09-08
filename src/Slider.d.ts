import React, { Element } from "@rbxts/react";

type ISliderBackgroundProps = {
    Disabled?: boolean;
    Hover: boolean;
    Dragging: boolean;
    Value: number;
};

type ISliderProps = {
    Max: number;
    Min: number;
    Value: number;
    OnChange: (value: number) => void;
    Step?: number;
    Disabled?: boolean;
    Background?:
        | React.FunctionComponent<ISliderBackgroundProps>
        | React.ComponentConstructor<ISliderBackgroundProps>;
} & Partial<
    Pick<Frame, "Size" | "Position" | "AnchorPoint" | "LayoutOrder" | "ZIndex">
>;

export const Slider: (props: ISliderProps) => Element;
