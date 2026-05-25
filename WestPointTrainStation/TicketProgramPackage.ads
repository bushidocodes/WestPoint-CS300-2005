PACKAGE TicketProgramPackage IS
    PROCEDURE View_Total_Sales (TotalProfit : IN Float);
    --Pre: Inputs Total Profit
    --Post: Outputs the total profit to the user
    PROCEDURE Check_Tickets (NewburgSupply : IN Integer; NyackSupply : IN Integer);
    --Pre: Input Integer values of the number of Newburg and Nyack tickets available
    --Post: Lists out the tickets available
    PROCEDURE Find_Change (TotalChange : IN Float);
    --Pre: Input amount of change
    --Post: Outputs the number of each increment of change that must be returned
END TicketProgramPackage;
