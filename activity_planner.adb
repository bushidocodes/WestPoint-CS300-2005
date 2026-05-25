WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Days_Enum; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Days_Enum; 

PROCEDURE Activity_Planner IS 
   Menu_Choice : Natural := 0; 
   Today : Days; 
   Tomorrow : Days; 
   Temperature : Float := -100.0; 
   Selected : Boolean := False; 

BEGIN 
   WHILE Menu_Choice /= 5 LOOP 
      New_Line; 
      Menu_Choice := Get_Menu_Choice; 
      New_Line; 
      CASE Menu_Choice IS 
         WHEN 1 => 
            Today := Get_Day; 
         WHEN 2 => 
            Tomorrow := Find_Tomorrow(Today); 
         WHEN 3 => 
            Temperature := Get_Temperature; 
            Selected := True; 
         WHEN 4 => 
            IF NOT Selected THEN 
               Temperature := Get_Temperature; 
               Selected := Select_Activity(Temperature); 
            ELSE 
               Selected := Select_Activity(Temperature); 
            END IF; 
         WHEN 5 => 
            Put_Line("Goodbye!"); 
         WHEN OTHERS => 
            Put_Line("Invalid choice!  Try again."); 
      END CASE; 
   END LOOP; 
END Activity_Planner;