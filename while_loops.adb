WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE While_Loops IS
   Miles : Integer;
BEGIN
   Put("Enter how many miles you want to run (1-10): ");
   Get(Miles);
   New_Line;

   WHILE Miles > 10 OR Miles < 1 LOOP
      Put("Number of miles should be between 1 and 10: ");
      Get(Miles);
      New_Line;
   END LOOP;

   Put("You will run ");
   Put(Miles, 1);
   Put_Line(" mile(s). Good luck!");
END While_Loops;
