WITH Ada.Text_IO;   USE Ada.Text_IO; 
WITH Ada.Integer_Text_IO;   USE Ada.Integer_Text_IO; 
WITH Ada.Float_Text_IO;   USE Ada.Float_Text_IO; 

PROCEDURE File_IO_Demo IS 
   MAXSIZE : CONSTANT Positive := 25; 
   Done : Boolean := FALSE; 
   InF:File_Type; 
   OutF:File_Type; 
   Choice : Character; 
   Prime_Key: String(1..3):="   "; 

   TYPE Cadet_Record IS RECORD 
     Initials : String(1..3) := "   "; 
     GPA : Float; 
     Credit_Hours : Float; 
     Grad_Year : Natural; 
   END RECORD; 

   TYPE Cadet_Array IS ARRAY(1..MAXSIZE) OF Cadet_Record; 
   Cadet_File : Cadet_Array; 

   PROCEDURE Display_Records IS 
   BEGIN 
      FOR I IN 1..MAXSIZE LOOP 
         IF Cadet_File(I).Initials /= "   " THEN 
            Put(I); 
            Put(". "); 
            Put(Cadet_File(I).Initials); 
            Put(", Class of  "); 
            Put(Cadet_File(I).Grad_Year,4); 
            Put("-- GPA: "); 
            Put(Cadet_File(I).GPA,1,2,0); 
            Put(", CH: "); 
            Put(Cadet_File(I).Credit_Hours,3,1,0); 
            New_Line; 
         ELSE 
            EXIT; 
         END IF; 
      END LOOP; 
   END Display_Records; 

   --Read a line from gpa.txt 
   PROCEDURE Read_Record (This_Line : OUT Cadet_Record) IS 
   BEGIN 
      Get(InF,This_Line.Initials); 
      Get(InF,This_Line.GPA); 
      Get(InF,This_Line.Credit_Hours); 
      Get(InF,This_Line.Grad_Year); 
   END Read_Record; 

   --Read gpa.txt and save each line into Cadet_File 
   PROCEDURE Read_File IS 
   Counter:Integer:=1; 
   BEGIN 
      Open(InF, In_File, "gpa.txt"); 
      WHILE NOT End_Of_File(InF) LOOP 
        Read_Record(Cadet_File(Counter)); 
        Skip_Line(InF); 
        Put(Counter, Width=>1); 
        Put(" Record(s) Read"); 
        New_Line; 
        Counter:=Counter+1; 
      END LOOP; 
      Close(InF); 
   END Read_File; 

   PROCEDURE Manual_Input ( Record_Inputed : OUT Cadet_Record ) IS 
   BEGIN 
      Record_Inputed.Initials:=Prime_Key; 
      Put("Enter the cadet's GPA: "); 
      Get(Record_Inputed.GPA); 
      New_Line; 
      Put("Enter the cadet's credit hour total: "); 
      Get(Record_Inputed.Credit_Hours); 
      New_Line; 
      Put("Enter the cadet's graduation year: "); 
      Get(Record_Inputed.Grad_Year); 
      New_Line; 
   END Manual_Input; 

   PROCEDURE Save_Record (This_Line : IN Cadet_Record) IS 
   BEGIN 
      Put(OutF,This_Line.Initials); 
      Put(OutF,This_Line.GPA); 
      Put(OutF,This_Line.Credit_Hours); 
      Put(OutF,This_Line.Grad_Year); 
      New_Line(OutF); 
   END Save_Record; 

   --Add code necessary to write the contents of Cadet_File to gpa.txt 
   PROCEDURE Save_File  IS 
   BEGIN 
      Create(OutF, Out_File, "gpa.txt"); 
      FOR I IN 1..MAXSIZE LOOP 
         IF Cadet_File(I).Initials="   " THEN 
            EXIT; 
         END IF; 
         Save_Record(Cadet_File(I)); 
         Put(I); 
         Put(" Records Saved"); 
         New_Line; 
      END LOOP; 
      Close(OutF); 
   END Save_File; 

BEGIN 
   WHILE NOT Done LOOP 
      Put("[D]isplay, [R]ead from file, [M]anual entry, or [Q]uit? >>"); 
      Get(Choice); 
      New_Line; 
      CASE Choice IS 
         WHEN 'D' => 
            Display_Records; 
         WHEN 'R' => 
            Read_File; 
         WHEN 'M' => 
            Put("Enter the cadet's initials: "); 
            Get(Prime_Key); 
            New_Line; 
            FOR I IN 1..MAXSIZE LOOP 
               IF Cadet_File(I).Initials = Prime_Key THEN 
                  Manual_Input(Cadet_File(I)); 
                  EXIT; 
               END IF; 
               IF Cadet_File(I).Initials = "   " THEN 
                  Manual_Input(Cadet_File(I)); 
                  EXIT; 
               END IF; 
            END LOOP; 
         WHEN 'Q' => 
            Save_File; 
            Done := TRUE; 
         WHEN OTHERS => 
            Put_Line("Invalid input!"); 
      END CASE; 
   END LOOP; 
END File_IO_Demo; 