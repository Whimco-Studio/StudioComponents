import { Element } from "@rbxts/roact"

type ICheckBoxProps = {
    Disabled?: boolean;
    Value?: boolean;
    Label: string;
    RichText?: boolean;
    OnActivated?: () => void;

} & Partial<WritableProperties<Frame>>


export const Checkbox: (props: ICheckBoxProps) => Element