import Roact, { Element } from "@rbxts/roact";

type IBackgroundProps = {
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
        | Roact.FunctionComponent<IBackgroundProps>
        | Roact.ComponentConstructor<IBackgroundProps>;
} & Partial<
    Pick<Frame, "Size" | "Position" | "AnchorPoint" | "LayoutOrder" | "ZIndex">
>;

export const Slider: (props: ISliderProps) => Element;
