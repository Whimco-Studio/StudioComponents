import { Element } from "@rbxts/roact";

export type ITab<N extends string> = {
    Name: N;
    Disabled?: boolean;
};

type ITabContainerProps<N extends string> = {
    Tabs: ITab<N>[];
    OnTabSelected: (tab: N) => void;
    SelectedTab?: N;
} & Partial<
    Pick<Frame, "Size" | "Position" | "AnchorPoint" | "LayoutOrder" | "ZIndex">
>;

export const TabContainer: <N extends string>(
    props: ITabContainerProps<N>
) => Element;
