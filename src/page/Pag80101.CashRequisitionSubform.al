page 80101 "Cash Requisition Subform"
{
    ApplicationArea = All;
    Caption = 'Cash Requisition Subform';
    PageType = ListPart;
    SourceTable = "Cash Requisition Lines";
    AutoSplitKey=true;
    DelayedInsert=true;
    MultipleNewLines=true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ToolTip = 'Specifies the value of the Requisition No. field.', Comment = '%';
                    Visible=false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                    Visible=false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                    Visible=false;
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.', Comment = '%';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Staff Code"; Rec."Staff Code")
                {
                    ToolTip = 'Specifies the value of the Staff Code field.', Comment = '%';
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.', Comment = '%';
                }
                field("To Date"; Rec."To Date")
                {
                    ToolTip = 'Specifies the value of the To Date field.', Comment = '%';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.', Comment = '%';
                }
                field(Transferred; Rec.Transferred)
                {
                    ToolTip = 'Specifies the value of the Transferred field.', Comment = '%';
                }
                field("Transfer Status"; Rec."Transfer Status")
                {
                    ToolTip = 'Specifies the value of the Transfer Status field.', Comment = '%';
                }
                field("Transferred Amount"; Rec."Transferred Amount")
                {
                    ToolTip = 'Specifies the value of the Transferred Amount field.', Comment = '%';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining Amount field.', Comment = '%';
                }
            }

            field(Totals; Totals)
            {
                Editable = false;
                Caption = 'Total';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CalculateTotalAmount();
    end;

    local procedure CalculateTotalAmount()
    var
        CashRequisitionLines: Record "Cash Requisition Lines";
    begin
        Totals:=0;
            CashRequisitionLines.Reset();
            CashRequisitionLines.SetRange("Requisition No.", Rec."Requisition No.");
            if CashRequisitionLines.FindSet() then begin
                repeat begin
                    // Method 1
                    // Totals += CashRequisitionLines.Amount;
                    // Method 2
                    CashRequisitionLines.CalcSums(Amount);
                    Totals:=CashRequisitionLines.Amount;
                end until CashRequisitionLines.Next() = 0;
            end;
    end;

    var
        Totals: Decimal;
}
