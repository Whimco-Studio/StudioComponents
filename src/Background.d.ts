import { Element } from "@rbxts/roact"

interface IBackgroundProps {
    Size?: UDim2;
    Position?: UDim2;
    AnchorPoint?: Vector2;
    LayoutOrder?: number;
    ZIndex?: number;
}

export const Background: (props: IBackgroundProps) => Element