pageextension 50280 "Sales Order List Ext" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("Promised Delivery Date"; "Promised Delivery Date")
            {
                ApplicationArea = all;
            }
            field("Ship-to Address"; "Ship-to Address")
            {
                ApplicationArea = all;
            }

        }
    }
}
