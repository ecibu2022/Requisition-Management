enum 80100 "Requisition Status"
{
    Extensible = true;
    
    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }
    value(2; Released)
    {
        Caption = 'Released';
    }
    value(3; Rejected)
    {
        Caption = 'Rejected';
    }
}
