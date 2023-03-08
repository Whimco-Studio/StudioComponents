import { Element } from "@rbxts/roact"

type IVerticalCollapsibleSectionProps<T> = {
    LayoutOrder?: number,
    ZIndex?: number,
    Collapsed?: boolean,
    HeaderText?: string
} & Partial<WritableProperties<Frame>>

export const VerticalCollapsibleSection: <T>(props: IVerticalCollapsibleSectionProps<T>) => Element