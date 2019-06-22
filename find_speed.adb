WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 

PROCEDURE Find_Speed IS 
   SUBTYPE Footmarch_Distance IS Natural RANGE 0..30; 
   HowLong : Natural; 
   HowFast : Natural; 
   HowFar : Footmarch_Distance; 
BEGIN 
   --get hours and distance 
   Put ("How many hours will you be rucking it, Commander? Errinern Sie sich dass ihre Soldaten Muede nach zwoelf Stunden Marschieren werden > "); 
   Get (HowLong); 
   Put ("Wie weit muessen Sie marchieren? > "); 
   Get (HowFar); 
   --compute speed required 
   HowFast := HowFar / HowLong; 
   --display results 
   Put ("You need to travel at "); 
   Put (HowFast); 
   Put ( " miles per hour."); 
   New_Line; 
END Find_Speed; 