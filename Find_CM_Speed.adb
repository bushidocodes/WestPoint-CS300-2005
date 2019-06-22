WITH Ada.Text_IO; 
WITH Ada.Integer_Text_IO; 
WITH Ada.Float_Text_IO; 

PROCEDURE Find_CM_Speed IS 
   Distance : Float; 
   PROCEDURE CM_To_Inch IS 
   -------------------------------- 
   -- Converts centimeters to inches (from Lsn02) 
   -- Modifications:  added last line 
   -------------------------------- 
      InchPerCM : CONSTANT Float := 0.3937; 
      Inches : Float; 
      Centimeters : Float; 
   BEGIN 
      --Prompt user for value in centimeters 
      Ada.Text_IO.Put (Item => "Enter a length in centimeters>> "); 
      Ada.Float_Text_IO.Get (Item => Centimeters); 
      --Compute equivalent value in inches 
      Inches := InchPerCM * Centimeters; 
      --Display result 
      Ada.Text_IO.Put (Item => "That equals "); 
      Ada.Float_Text_IO.Put (Item => Inches); 
      Ada.Text_IO.Put (Item => " inches"); 
      Ada.Text_IO.New_Line; 
      --allow the main program to access the result 
      Distance := Inches; 
   END CM_To_Inch; 

   PROCEDURE Find_Speed IS 
   -------------------------------- 
   -- Finds required speed, given time and distance (from Lsn03) 
   -- Modifications: make variables floats, set HowFar to Distance, remove Put and Get for HowFar, change output verbage to "inches per second" 
   -------------------------------- 
      HowLong : Float; 
      HowFast : Float; 
      HowFar : Float := Distance; 
   BEGIN 
      --get hours and distance 
      Ada.Text_IO.Put ("How many seconds will you be traveling? > "); 
      Ada.Float_Text_IO.Get (HowLong); 
    --  Ada.Text_IO.Put ("How far do you want to travel? > "); 
    --  Ada.Integer_Text_IO.Get (HowFar); 
      --compute speed required 
      HowFast := HowFar / HowLong; 
      --display results 
      Ada.Text_IO.Put ("You need to travel at "); 
      Ada.Float_Text_IO.Put (HowFast); 
      Ada.Text_IO.Put ( " inches per second."); 
      Ada.Text_IO.New_Line; 
   END Find_Speed; 
   
BEGIN 
   CM_To_Inch; 
   Find_Speed; 
END Find_CM_Speed; 