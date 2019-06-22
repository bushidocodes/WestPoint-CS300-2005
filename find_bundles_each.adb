--CDT Sean McBride 
WITH Ada.Text_IO; USE Ada.Text_IO; 
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO; 

PROCEDURE Find_Bundles_Each IS 
   SUBTYPE Plebes IS Integer Range 1..35; 
   Duty_Plebes : Plebes; 
   SUBTYPE Bundles IS Integer Range 0..105; 
   Bundles_To_Deliver : Bundles; 
   Min_Bundles_Each, Plebes_With_Min : Integer; 
   Bundles_Remaining : Integer; 
   Max_Bundles_Each, Plebes_With_Max : Integer; 

BEGIN 
   LOOP 
      BEGIN 
         Put("Enter the number of plebes present for duties: "); 
         Get(Duty_Plebes); 
         Skip_Line; 
         EXIT; 
      EXCEPTION 
         WHEN Data_Error => 
            Skip_Line; 
            Put_Line("Error - Try again. Input Integer between 1 and 35"); 
            New_Line; 
         WHEN Constraint_Error => 
            Skip_Line; 
            Put_Line("Error - Try again.  Between 1 and 35"); 
            New_Line; 
      END; 
   END LOOP; 
   LOOP 
      BEGIN 
            Put("Enter the number of laundry bundles to deliver: "); 
            Get(Bundles_To_Deliver); 
            Skip_Line; 
            EXIT; 
      EXCEPTION 
         WHEN Data_Error => 
            Skip_Line; 
            Put_Line("Error - Try again. Input Integer between 0 and 105"); 
            New_Line; 
         WHEN Constraint_Error => 
            Skip_Line; 
            Put_Line("Error - Try again between 0 and 105"); 
            New_Line; 
      END; 
   END LOOP; 
   Min_Bundles_Each := Bundles_To_Deliver / Duty_Plebes; 
   Bundles_Remaining := Bundles_To_Deliver REM Duty_Plebes; 
   Plebes_With_Max := Bundles_Remaining; 
   Plebes_With_Min := Duty_Plebes - Plebes_With_Max; 
   Max_Bundles_Each := Min_Bundles_Each + 1; 
   Put(Plebes_With_Max); 
   Put(" plebe(s) : "); 
   Put(Max_Bundles_Each); 
   Put_Line(" bundle(s) each"); 
   Put(Plebes_With_Min); 
   Put(" plebe(s) : "); 
   Put(Min_Bundles_Each); 
   Put_Line(" bundle(s) each"); 
END Find_Bundles_Each; 