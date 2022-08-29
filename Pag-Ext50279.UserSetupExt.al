pageextension 50279 "User Setup Ext" extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field("Sales Order Default Country"; Rec."Sales Order Default Country")
            {
                ApplicationArea = all;
                Caption = 'Sales Orders Default Country';
                ToolTip = 'sets the default country to pick on the sales order';
                TableRelation = "Country/Region" where("Load On Sales Order" = const(true));
            }

        }
    }
}
