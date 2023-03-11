import { Element } from "@rbxts/roact";

type IVerticalCollapsibleSectionProps<T> = {
    OnToggled: () => void;
    LayoutOrder?: number;
    ZIndex?: number;
    Collapsed?: boolean;
    HeaderText?: string;
};

export const VerticalCollapsibleSection: <T>(
    props: IVerticalCollapsibleSectionProps<T>
) => Element;
