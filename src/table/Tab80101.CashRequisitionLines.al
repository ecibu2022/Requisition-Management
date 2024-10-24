table 80101 "Cash Requisition Lines"
{
    Caption = 'Cash Requisition Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Requisition No."; Code[20])
        {
            Caption = 'Requisition No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Type"; Enum Type)
        {
            Caption = 'Type';
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation="G/L Account";
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                GLAccount.Reset();
                GLAccount.SetRange("No.", Rec."No.");
                if GLAccount.FindSet() then begin
                    repeat begin
                        Rec.Name:=GLAccount.Name;
                    end until GLAccount.Next()=0;
                end;
            end;
        }
        field(6; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Rec.Amount := Rec.Quantity * Rec."Unit Cost";
            end;
        }
        field(8; "Unit of Measure"; Code[20])
        {
            Caption = 'Unit of Measure';
            TableRelation="Unit of Measure";
        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            trigger OnValidate()
            begin
                Rec.Amount:=Rec.Quantity*Rec."Unit Cost";
            end;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable=false;
        }
        field(11; "Staff Code"; Code[20])
        {
            Caption = 'Staff Code';
            TableRelation=Employee;
        }
        field(12; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(13; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(14; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            TableRelation="Fixed Asset";
        }
        field(15; Transferred; Boolean)
        {
            Caption = 'Transferred';
        }
        field(16; "Transfer Status"; Enum "Transfer Status")
        {
            Caption = 'Transfer Status';
        }
        field(17; "Transferred Amount"; Decimal)
        {
            Caption = 'Transferred Amount';
        }
        field(18; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
        }
    }
    keys
    {
        key(PK; "Requisition No.","Line No.")
        {
            Clustered = true;
        }
    }
}
