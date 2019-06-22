WITH Ada.Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO, Ada.Integer_Text_IO; 

PROCEDURE Convert_Grade IS 
   Score : Integer; 
BEGIN 
   Put("Enter the score >"); 
   Get(Score); 
   New_Line; 
   Put("Grade received: "); 

   CASE Score IS 
      WHEN 90..100 => 
         Put('A'); 
      WHEN 80..89 => 
         Put('B'); 
      WHEN 70..79 => 
         Put('C'); 
      WHEN 60..69 => 
         Put('D'); 
      WHEN 0..59 => 
         Put('F'); 
      WHEN OTHERS => 
         Put("Invalid input!"); 
   END CASE; 

END Convert_Grade; 