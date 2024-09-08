import { Element } from "@rbxts/react";

type IVerticalCollapsibleSectionProps = {
    OnToggled: () => void;
    LayoutOrder?: number;
    ZIndex?: number;
    Collapsed?: boolean;
    HeaderText?: string;
};

export const VerticalCollapsibleSection: (
    props: IVerticalCollapsibleSectionProps
) => Element;
