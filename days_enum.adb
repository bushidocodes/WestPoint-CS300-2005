WITH Ada.Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO; 

PROCEDURE Days_Enum IS 
   TYPE Days IS (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday); 

   PACKAGE DAY_IO IS NEW Ada.Text_IO.Enumeration_IO(Enum=>Days); 

   Today : Days; 
   Tomorrow : Days; 
   Temp : Natural; 

BEGIN 
   --get the day 
   Put (Item => "What is Today?"); 
   Day_IO.Get(Today); 

   --calculate tomorrow 
   IF Today = Days'Last THEN 
     Tomorrow := Days'First; 
   ELSE 
      Tomorrow := Days'Succ(Today); 
   END IF; 

   --display results 
   Put (Item => "Tomorrow is "); 
   Day_IO.Put (Item => Tomorrow); 

   --get tomorrow's temperature 
   Put ("What is Tomorrow's Temperature?"); 
   Ada.Integer_Text_IO.Get(temp); 
   IF Temp > 90 THEN 
      Put ("Go Swimming"); 
   ELSIF Temp > 65 THEN 
      Put ("Go Hiking"); 
   ELSIF Temp > 30 THEN 
      Put ("Watch Movie"); 
   ELSE 
      Put ("Go Skiing"); 
   END IF; 
END Days_Enum; 