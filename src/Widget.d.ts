import { Element } from "@rbxts/react";

type IWidgetProps = {
    Id: string;
    Title?: string;
    Name?: string;
    InitialDockState?: Enum.InitialDockState;
    FloatingWindowSize?: Vector2;
    MinimumWindowSize?: Vector2;
    OnClosed?: () => void;
};

export const Widget: (props: IWidgetProps) => Element;
