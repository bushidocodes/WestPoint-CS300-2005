WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, TicketProgramPackage; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, TicketProgramPackage; 

PROCEDURE TicketProgram IS 
    MenuChoice : Natural := 0; 
    NewburgCost : CONSTANT Float := 3.50; 
    NyackCost : CONSTANT Float := 5.25; 
    NewburgSupply : Integer := 10; 
    NyackSupply : Integer := 15; 
    NumberTickets : Integer; 
    TotalCost : Float := 0.00; 
    AmountPaid :Float := 0.00; 
    TotalChange : Float := 0.00; 
    TotalProfit : Float := 0.00; 

    PROCEDURE Newburg IS 
    BEGIN 
        Put("Purchase how many tickets to Newburg?"); 
        New_Line; 
        Put(">"); 
        Get(NumberTickets); 
        IF NewburgSupply - NumberTickets >= 0 AND NumberTickets > 0 THEN 
            New_Line; 
            Put("Sufficient Supply"); 
            TotalCost := NewburgCost * Float(NumberTickets); 
            New_Line; 
            Put("The total cost is > $"); 
            Put(TotalCost,Aft=>2,Exp=>0); 
            New_Line; 
            Put ("Enter amount paid"); 
            New_Line; 
            Put("> $"); 
            Get(AmountPaid); 
            TotalChange := AmountPaid - TotalCost; 
            IF TotalChange >= 0.0 THEN 
                Find_Change(TotalChange); 
                NewburgSupply := NewburgSupply - NumberTickets; 
                TotalProfit := TotalProfit + TotalCost; 
            ELSE 
                Put("Insufficient Payment: Transaction Terminated"); 
            END IF; 

        ELSIF NumberTickets <= 0 THEN 
            New_Line; 
            Put("Invalid Input"); 
        ELSE 
            New_Line; 
            Put("Insufficient Supply"); 
            Check_Tickets(NewburgSupply,NyackSupply);
        END IF;  
    END Newburg;

    PROCEDURE Nyack IS 
    BEGIN 
        Put("Purchase how many tickets to Nyack?"); 
        New_Line; 
        Put(">"); 
        Get(NumberTickets); 
        IF NyackSupply - NumberTickets >= 0 AND NumberTickets > 0 THEN 
            New_Line; 
            Put("Sufficient Supply"); 
            TotalCost := NyackCost * Float(NumberTickets); 
            New_Line; 
            Put("The total cost is > $"); 
            Put(TotalCost,Aft=>2,Exp=>0); 
            New_Line; 
            Put ("Enter amount paid"); 
            New_Line; 
            Put("> $"); 
            Get(AmountPaid); 
            TotalChange := AmountPaid - TotalCost; 
            IF TotalChange >= 0.0 THEN 
                Find_Change(TotalChange); 
                NyackSupply := NyackSupply - NumberTickets; 
                TotalProfit := TotalProfit + TotalCost; 
            ELSE 
                Put("Insufficient Payment: Transaction Terminated"); 
            END IF; 
        ELSIF NumberTickets <= 0 THEN 
            New_Line; 
            Put("Invalid Input"); 
        ELSE 
            New_Line; 
            Put("Insufficient Supply"); 
            Check_Tickets(NewburgSupply,NyackSupply); 
        END IF; 
    END Nyack; 

PROCEDURE TrainDeparture IS 
    TYPE Trains IS (nyack, newburg, quit, nothing); 
    PACKAGE Trains_IO IS NEW Ada.Text_IO.Enumeration_IO(Enum=>Trains); 
    SubmenuChoice : Trains := nothing; 
BEGIN 
    WHILE SubmenuChoice /= quit LOOP 
        Put("Train Departure Submenu:"); 
        New_Line; 
        Put("Type 'newburg' to process Train Departure to Newburg"); 
        New_Line; 
        Put("Type 'nyack' to process Train Departure to Nyack"); 
        New_Line; 
        Put("Type 'quit' to return to Main Menu"); 
        New_Line; 
        Put(">"); 
        Trains_IO.Get(SubmenuChoice); 
        IF SubmenuChoice = newburg 
        THEN 
            NewburgSupply := 10; 
        ELSIF SubmenuChoice = nyack 
        THEN 
            NyackSupply := 15; 
        ELSIF SubmenuChoice = Quit 
        THEN 
            NULL; 
        ELSE 
            New_Line; 
            Put("Invalid Input: Reenter"); 
            New_Line;
            New_Line; 
        END IF; 
    END LOOP; 

END TrainDeparture;  

BEGIN 
   WHILE MenuChoice /= 6 LOOP 
        New_Line; 
        Put("Main Menu:"); 
        New_Line; 
        Put("1)Sell Tickets to Newburg"); 
        New_Line; 
        Put("2)Sell Tickets to Nyack"); 
        New_Line; 
        Put("3)Process Train Departure"); 
        New_Line; 
        Put("4)Check Tickets Remaining"); 
        New_Line; 
        Put("5)View Total Sales"); 
        New_Line; 
        Put("6)End Program"); 
        New_Line; 
        Put(">"); 

        Get(MenuChoice); 
        IF MenuChoice = 1 
        THEN 
            New_Line; 
            Newburg; 
            New_Line; 
        ELSIF MenuChoice = 2 
        THEN 
            New_Line; 
            Nyack; 
            New_Line; 
        ELSIF MenuChoice = 3 
        THEN 
            New_Line; 
            TrainDeparture; 
            New_Line; 
        ELSIF MenuChoice = 4 
        THEN 
            New_Line; 
            Check_Tickets(NewburgSupply,NyackSupply); 
            New_Line; 
        ELSIF MenuChoice = 5 
        THEN 
            New_Line; 
            View_Total_Sales(TotalProfit); 
            New_Line; 
        END IF; 
    END LOOP; 
END TicketProgram; 

