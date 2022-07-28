codeunit 50277 "Utils "
{
    Local procedure FnCountriesArray() CountriesArray: Text[250]
    var
        Countries: Record "Country/Region";
    begin
        CLEAR(CountriesArray);
        Countries.SetRange("Load On Sales Order", true);
        IF Countries.FINDFIRST THEN
            REPEAT
                CountriesArray := FORMAT(CountriesArray) + ',' + FORMAT(Countries.Name);
            UNTIL Countries.NEXT = 0;
    end;

    Local Procedure FnGetRespCenterCode(VAR PPosition: Integer) RespCenterCode: Code[20]
    var
        Countries: record "Country/Region";
        LCounter: Integer;
    begin
        CLEAR(RespCenterCode);
        CLEAR(LCounter);
        LCounter := 1;
        Countries.SetRange("Load On Sales Order", true);
        IF Countries.FINDFIRST THEN
            REPEAT
                LCounter := LCounter + 1;
                IF LCounter = PPosition THEN RespCenterCode := Countries.Code;
            UNTIL Countries.NEXT = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    procedure FnSetCountry(var Rec: Record "Sales Header")
    var
        UserSetup: Record "User Setup";
        Options: Text[30];
        Selected: Integer;
        Text000: Label 'Click Cancel If you are not Invoicing For the listed countries';
    begin
        if Rec."Document Type" = Rec."Document Type"::Order then begin
            if UserSetup.Get(UserId) then begin
                if UserSetup."Sales Order Default Country" <> '' then begin
                    Rec."Country of Order" := UserSetup."Sales Order Default Country";
                    Rec.Modify()
                end else begin
                    Selected := dialog.STRMENU(FnCountriesArray, 10, Text000);
                    Rec."Country of Order" := FnGetRespCenterCode(Selected);
                    Rec.Modify();
                end;
            end
        end
    end;
}
