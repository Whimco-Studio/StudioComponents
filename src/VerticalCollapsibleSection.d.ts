import { Element } from "@rbxts/roact";

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
