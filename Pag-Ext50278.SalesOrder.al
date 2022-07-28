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
        modify("Quote No.")
        {
            Editable = true;
        }
        modify("Ship-to code")
        {
            editable = true;
        }
        modify(Status)
        {
            Editable = true;
        }
        modify("Ship-to Address")
        {
            Editable = true;
        }
        modify("Ship-to Country/Region Code")
        {
            Editable = true;

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
