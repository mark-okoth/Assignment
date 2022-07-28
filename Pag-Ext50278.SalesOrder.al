pageextension 50278 "Sales Order" extends "Sales Order"
{
    layout
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                Utils: Codeunit "Utils ";
            begin
                Utils.FnSetCountry(Rec);
            end;
        }

        addafter(Status)
        {
            field("Country of Order"; Rec."Country of Order")
            {
                ApplicationArea = all;
                Caption = 'Country of Order';
                ToolTip = 'the country set for the user on the user setup or selected when creating a new order';
            }
        }
    }
}
