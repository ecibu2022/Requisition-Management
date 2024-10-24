table 80100 "Cash Requisition"
{
    Caption = 'Cash Requisition';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", "Requested By", "Document Date";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; Department; Code[20])
        {
            Caption = 'Department';
        }
        field(5; Status; Enum "Requisition Status")
        {
            Caption = 'Status';
        }
        field(6; Comments; Text[1024])
        {
            Caption = 'Comments';
        }
        field(7; Description; Text[400])
        {
            Caption = 'Description';
        }
        field(8; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            TableRelation=Currency;
        }
        field(9; "Requested Date"; Date)
        {
            Caption = 'Requested Date';
        }
        field(10; "Requested By"; Code[20])
        {
            Caption = 'Requested By';
            Editable=false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Rec."Requested By":=UserId;
    end;
}
