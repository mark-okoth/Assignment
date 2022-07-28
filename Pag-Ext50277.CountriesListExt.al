pageextension 50277 "Countries List Ext" extends "Countries/Regions"
{
    layout
    {
        addafter(Code)
        {
            field("Load On Sales Order"; Rec."Load On Sales Order")
            {
                ApplicationArea = all;
                Caption = 'Load On Sales Order';
                ToolTip = 'Countries that are automatically loaded when then country filter is not populated on the user setup';
            }
        }
    }
}
