WITH Ada.Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO, Ada.Integer_Text_IO; 

PROCEDURE Nested_Loops IS 
   Miles : Integer; 
BEGIN 
   Put("Enter how many miles you want to run: "); 
   Get(Miles); 
   New_Line; 
   WHILE Miles > 10 OR Miles < 1 LOOP 
        Put("Number of miles should be between 1 and 10: "); 
        Get(Miles); 
        New_Line; 
   END LOOP; 
   Put_Line("            Lap Counter   Mile Counter"); 
   FOR OuterCounter IN 1..Miles LOOP 
      FOR InnerCounter IN 1..4 LOOP 
         Put("Ran a 1/4 mile"); 
         Put(InnerCounter, 22); 
         New_Line; 
      END LOOP; 
      Put("Ran a mile"); 
      Put(OuterCounter, 10); 
      New_Line; 
   END LOOP; 
END Nested_Loops;