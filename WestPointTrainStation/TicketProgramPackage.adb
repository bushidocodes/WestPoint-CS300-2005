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

WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 

PACKAGE BODY TicketProgramPackage IS 
    PROCEDURE View_Total_Sales (TotalProfit : IN Float) IS 
    BEGIN 
        New_Line; 
        Put("The total of sales is $"); 
        Put(TotalProfit,Aft=>2,Exp=>0); 
    END View_Total_Sales; 

    PROCEDURE Check_Tickets (NewburgSupply : IN Integer; NyackSupply : IN Integer) IS 
        Counter : Integer; 
    BEGIN 
        New_Line; 
        Counter := 1; 
        Put("Ticket Inventory:"); 
        New_Line; 

        WHILE NewburgSupply - Counter >= 0 LOOP 
            Put(Counter); 
            Put(" Newburg Ticket"); 
            New_Line; 
            Counter := Counter +1; 
        END LOOP; 

        New_Line; 
        Counter := 1; 

        FOR  Count IN 1..NyackSupply  LOOP
            Put(Count); 
            Put(" Nyack Ticket"); 
            New_Line; 
        END LOOP; 
    END Check_Tickets; 

    PROCEDURE Find_Change (TotalChange: IN Float) IS 
        TotalChangeHundred : Float; 
        TotalChangeInteger : Integer; 
        NumberDollars : Integer; 
        NumberQuarters : Integer; 
        NumberDimes : Integer; 
        NumberNickels : Integer; 
        NumberPennies : Integer; 

        FUNCTION Find_Number_Coins(Value,Amount:Integer)RETURN Integer IS 
            Number : Natural := 0; 
            Amount_Internal : Integer; 
        BEGIN 
            Amount_Internal := Amount; 
            WHILE Value <= Amount_Internal LOOP 
                Number := Number + 1; 
                Amount_Internal := Amount_Internal - Value; 
            END LOOP; 
            RETURN Number; 
        END Find_Number_Coins; 

    BEGIN 
       --Initialize variable; 
       NumberDollars := 0; 
       NumberQuarters := 0; 
       NumberDimes := 0; 
       NumberNickels := 0; 
       NumberPennies := 0; 
      
       --convert TotalChange to TotalChangeInteger 
       TotalChangeHundred := TotalChange * 100.0; 
       TotalChangeInteger := Integer(TotalChangeHundred); 

       --calculate amount of dollars needed 
       NumberDollars := Find_Number_Coins(100,TotalChangeInteger); 
       TotalChangeInteger := TotalChangeInteger - (NumberDollars * 100); 
       NumberQuarters := Find_Number_Coins(25,TotalChangeInteger); 
       TotalChangeInteger := TotalChangeInteger - (NumberQuarters * 25); 
       NumberDimes := Find_Number_Coins(10,TotalChangeInteger); 
       TotalChangeInteger := TotalChangeInteger - (NumberDimes * 10); 
       NumberNickels := Find_Number_Coins(5,TotalChangeInteger); 
       TotalChangeInteger := TotalChangeInteger - (NumberNickels * 5); 
       NumberPennies := Find_Number_Coins(1,TotalChangeInteger); 
       TotalChangeInteger := TotalChangeInteger - (NumberPennies * 1); 

       --Output Results 
       New_Line; 
       Put("Give the customer "); 
       Put(NumberDollars); 
       Put(" Dollars"); 
       New_Line; 
       Put("Give the customer "); 
       Put (NumberQuarters); 
       Put(" Quarters"); 
       New_Line; 
       Put("Give the customer "); 
       Put (NumberDimes); 
       Put(" Dimes"); 
       New_Line; 
       Put("Give the customer "); 
       Put (NumberNickels); 
       Put(" Nickels"); 
       New_Line; 
       Put("Give the customer "); 
       Put (NumberPennies); 
       Put (" Pennies"); 
    END Find_Change; 
End TicketProgramPackage; 
