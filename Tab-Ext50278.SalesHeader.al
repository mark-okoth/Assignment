tableextension 50278 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50277; "Country of Order"; Code[50])
        {
            Caption = 'Country of Order';
            TableRelation = "Country/Region";
            DataClassification = CustomerContent;
        }
    }
}
