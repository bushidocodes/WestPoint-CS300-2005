WITH Ada.Text_IO; 
WITH Ada.Float_Text_IO; 

PROCEDURE CM_To_Inch IS 
   -------------------------------- 
   -- Converts centimeters to inches 
   -------------------------------- 
   InchPerCM : CONSTANT Float := 0.3937; 
   Inches : Float; 
   Centimeters : Float; 

BEGIN 
   --Prompt user for value in inches 
   Ada.Text_IO.Put (Item => "Enter a length in centimeters>> "); 
   Ada.Float_Text_IO.Get (Item => Centimeters); 

   --Compute equivalent value in inches 
   Inches := InchPerCM * Centimeters; 

   --Display result 
   Ada.Text_IO.Put (Item => "That equals "); 
   Ada.Float_Text_IO.Put (Item => Inches); 
   Ada.Text_IO.Put (Item => " inches"); 
   Ada.Text_IO.New_Line; 
END CM_To_Inch; 