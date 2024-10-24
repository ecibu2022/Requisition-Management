page 80100 "Cash Requisition"
{
    ApplicationArea = All;
    Caption = 'Cash Requisition';
    PageType = Card;
    SourceTable = "Cash Requisition";
    UsageCategory=Documents;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    Editable=false;
                    Style=Unfavorable;
                }
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = '%';
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ToolTip = 'Specifies the value of the Requested Date field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
            }

            part(CashReqLines; "Cash Requisition Subform")
            {
                ApplicationArea=All;
                Caption='Lines';
                // Linking the Header and Lines
                SubPageLink="Requisition No."=field("No.");
                UpdatePropagation=Both;
            }
        }
    }

}
