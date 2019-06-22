WITH Ada.Text_IO; USE Ada.Text_IO; 

WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO; 

WITH Ada.Float_Text_IO; USE Ada.Float_Text_IO; 

 

PROCEDURE Menu_Demo IS 
   PROCEDURE Read_File; 

   TYPE Class_Name_Type IS ARRAY (1..9) OF String(1..5); 
   TYPE Classes_Credit_Type IS ARRAY (1..9) OF Credit_Type; 
   TYPE Grade_Letter_One_Type IS ARRAY (1..9) OF Grade_Type; 
   TYPE Grade_Letter_Two_Type IS ARRAY (1..9) OF Character; 
   TYPE Grade_Value IS ARRAY (1..9) OF Grade_Nums; 
   TYPE User_Record_Array IS ARRAY (1..25) OF User_Record_Type; 
   TYPE User_Record_Type IS RECORD
      Initials : String(1..3) := "   ";
      Old_GPA : Grade_Nums := 0.00;
      Credit_Hours_Completed : Float := 0.00;
      Number_Classes : Natural := 0;
      Classes_Value : Grade_Value;
      Class_Name : Class_Name_Type;
      Credit : Classes_Credit_Type;
   END RECORD;
   
   SUBTYPE Credit_Type IS Float RANGE 0.5..6.0; 
   SUBTYPE Grade_Nums IS Float RANGE 0.0..4.33; 
   SUBTYPE Grade_Type IS Character RANGE 'A'..'F'; 
   SUBTYPE Menu_Range IS Integer RANGE 0..4; 
   SUBTYPE Num_Classes IS Integer RANGE 1..9; 
   
   InF, OutF : File_Type; 
   Grade1 : Grade_Type; 
   Grade2 : Character; 
   The_Choice : Menu_Range; 
   User_Record : User_Record_Array; 

   FUNCTION PM  RETURN Float IS
   BEGIN
      IF End_Of_Line THEN
         RETURN 0.0;
      ELSE
         CASE Grade2 IS
            WHEN '+' =>
               RETURN 0.33;
            WHEN '-' =>
               RETURN -0.33;
            WHEN OTHERS =>
               Put_Line("Invalid Input!:");
               RETURN 0.0;
         END CASE;
      END IF;
   END PM;

   PROCEDURE Display_Menu IS 
   BEGIN 
      New_Line;
      Put_Line("Choices:");
      Put_Line("0) Modify cadet info");
      Put_Line("1) Enter grades");
      Put_Line("2) Display grades");
      Put_Line("3) Calculate Weighted GPA");
      Put_Line("4) Quit");
      Put("ENTER YOUR CHOICE >>");
      Get(The_Choice);
      New_Line;
   END Display_Menu;

   PROCEDURE Enter_Grades(First, Last : IN Integer) IS
   BEGIN
      FOR I IN First..Last LOOP
         Put("Enter the 5-character classname for class #");
         Put(I);
         Put(">>");
         Get(User_Record(1).Class_Name(I));
         Put("Enter letter grade (excluding and + or -) for ");
         Put(User_Record(1).Class_Name(I));
         Put(">>");
         Get(Grade1);
         Put("Enter + or - if applicable (hit enter if not) for ");
         Put(User_Record(1).Class_Name(I));
         Put(">>");
         Get(Grade2);

         IF Grade1 = 'A' AND Grade2 = '+' THEN 
            User_Record(1).Classes_Value(I) := 4.33; 
         ELSIF Grade1 = 'A' AND Grade2 = '-' THEN 
            User_Record(1).Classes_Value(I) := 3.67; 
         ELSIF Grade1 = 'A' THEN 
            User_Record(1).Classes_Value(I) := 4.00; 
         ELSIF Grade1 = 'B' AND Grade2 = '+' THEN 
            User_Record(1).Classes_Value(I) := 3.33; 
         ELSIF Grade1 = 'B' AND Grade2 = '-' THEN 
            User_Record(1).Classes_Value(I) := 2.67; 
         ELSIF Grade1 = 'B' THEN 
            User_Record(1).Classes_Value(I) := 3.00;
         ELSIF Grade1 = 'C' AND Grade2 = '+' THEN 
            User_Record(1).Classes_Value(I) := 2.33;
         ELSIF Grade1 = 'C' AND Grade2 = '-' THEN 
            User_Record(1).Classes_Value(I) := 1.67; 
         ELSIF Grade1 = 'C' THEN 
            User_Record(1).Classes_Value(I) := 2.00; 
         ELSIF Grade1 = 'D' THEN 
            User_Record(1).Classes_Value(I) := 1.00; 
         ELSIF Grade1 = 'F' THEN 
            User_Record(1).Classes_Value(I) := 0.00;
         END IF;

         Put("Point equivalent is: ");
         Put(User_Record(1).Classes_Value(I));
         New_Line;
         Put("Enter credit hours for class ");
         Put(I);
         Put(">>");
         Get(User_Record(1).Credit(I));
      END LOOP; 
   END Enter_Grades; 

   PROCEDURE Display_Grades IS 
      Choice : Integer; 
   BEGIN 
      FOR I IN 1..User_Record(1).Number_Classes LOOP
         New_Line;
         Put("Grade for class #");
         Put(I,0); Put(" : ");
         Put(User_Record(1).Class_Name(I)); Put(" : ");
         Put(User_Record(1).Classes_Value(I),2,2,0); Put(", ");
         Put(User_Record(1).Credit(I),2,2,0); Put(" CH ");
      END LOOP;
      LOOP
         New_Line;
         Put_Line("Reenter the data for a class (enter the class #),");
         Put("or return to main menu (enter '-1') >>");
         Get(Choice);
         IF Choice = -1 THEN
            EXIT;
         ELSIF Choice > 0 AND Choice < User_Record(1).Number_Classes + 1 THEN
            Enter_Grades(Choice,Choice);
            EXIT;
         ELSE
            Put("Invalid input: Enter either -1 to quit or a class number displayed above");
         END IF;
      END LOOP;
   END Display_Grades; 

   PROCEDURE Calculate_Weighted_GPA IS 
      Weighted_GPA, Sum, Sum_Credit : Float := 0.0; 
   BEGIN 
      FOR I IN 1..User_Record(1).Number_Classes LOOP 
         Sum := Sum + (User_Record(1).Classes_Value(I)*User_Record(1).Credit(I)); 
         Sum_Credit := Sum_Credit +User_Record(1).Credit(I); 
      END LOOP; 
      Weighted_GPA := ((User_Record(1).Old_GPA * User_Record(1).Credit_Hours_Completed) + Sum) / (Sum_Credit+User_Record(1).Credit_Hours_Completed); 
      Put("Weighted Grade Point Average: "); 
      Put(Weighted_GPA,2,2,0); 
      New_Line; 
   END Calculate_Weighted_GPA; 

   PROCEDURE Opening_Info IS 
   BEGIN 
      New_Line; 
      Put("Welcome to the GPA Calculator!"); 
      New_Line; 
      New_Line; 
      Put("Before we begin, please provide some background information..."); 
      New_Line; 
   END Opening_Info; 

   PROCEDURE Get_Cadet_Info IS 
      Command : Character; 
   BEGIN 
      Put("(L)oad GPA data or enter (N)ew data >>"); 
      Get(Command); 
      New_Line; 
      IF Command = 'L' THEN 
         Read_File; 
      ELSIF Command = 'N' THEN 
         New_Line; 
         Put("Enter the cadet's initials: >>"); 
         Get(User_Record(1).Initials); 
         Put("How many classes is "); Put(User_Record(1).Initials); Put(" currently taking? >>"); 
         Get(User_Record(1).Number_Classes); 
         Put("What is "); Put(User_Record(1).Initials); Put("'s GPA going into this semester? >>"); 
         Get(User_Record(1).Old_Gpa); 
         Put("How many credit hours did "); Put(User_Record(1).Initials); Put(" complete before this semester? >>"); 
         Get(User_Record(1).Credit_Hours_Completed); 
      ELSE 
         New_Line; 
         Put("Enter either L or N"); 
      END IF; 
   END Get_Cadet_Info; 

   PROCEDURE Read_Record (This_Line: OUT User_Record_Type) IS 
   BEGIN 
      NULL; 
      Get(InF,This_Line.Initials); 
      Get(InF,This_Line.Old_GPA); 
      Get(InF,This_Line.Credit_Hours_Completed); 
      Get(InF,This_Line.Number_Classes); 
      FOR I IN 1..This_Line.Number_Classes LOOP 
         Get(InF,This_Line.Classes_Value(I)); 
         Get(InF,This_Line.Class_Name(I)); 
         Get(InF,This_Line.Credit(I)); 
   END LOOP; 
   END Read_Record; 

   PROCEDURE Read_File IS 
   BEGIN 
      Open(InF,IN_File,"gpa.txt"); 
      LOOP 
         EXIT WHEN End_Of_File(InF); 
         LOOP 
            EXIT WHEN End_Of_Line(InF); 
            Read_Record(User_Record(1)); 
            NULL; 
            Skip_Line(InF); 
         END LOOP; 
      END LOOP; 
      Close(InF); 
   END Read_File; 

   PROCEDURE Save_Record (This_Line : IN User_Record_Type) IS 
   BEGIN 
      Put(OutF,This_Line.Initials); 
      Put(OutF,This_Line.Old_GPA); 
      Put(OutF,This_Line.Credit_Hours_Completed); 
      Put(OutF,This_Line.Number_Classes); 
      FOR I IN 1..This_Line.Number_Classes LOOP 
         Put(OutF,This_Line.Classes_Value(I)); 
         Put(OutF,This_Line.Class_Name(I)); 
         Put(OutF,This_Line.Credit(I)); 
      END LOOP; 
   END Save_Record;

   PROCEDURE Save_Statistics IS 
   BEGIN 
      Create(OutF,Out_File,"gpa.txt");
      FOR I IN 1..25  LOOP 
         IF User_Record(I).Initials="   " THEN
            EXIT; 
         END IF; 
         Save_Record(User_Record(I)); 
         Put(I); 
         Put(" Records Saved"); 
         New_Line; 
      END LOOP; 
      Close(OutF); 
   END Save_Statistics; 

BEGIN 
   Opening_Info; 
   Get_Cadet_Info; 

   LOOP 
      BEGIN --exception handler
      Display_Menu; 
      CASE The_Choice IS 
         WHEN 0 => 
            Get_Cadet_Info; 
         WHEN 1 => 
            Enter_Grades(1,User_Record(1).Number_Classes); 
         WHEN 2 => 
            Display_Grades; 
         WHEN 3 => 
            Calculate_Weighted_GPA; 
         WHEN 4 => 
            Save_Statistics; 
            EXIT; 
         WHEN OTHERS => NULL; 
      END CASE; 

      EXCEPTION 
         WHEN Data_Error => 
            Skip_Line; 
            Put_Line("Enter a number 0-4.  Try agian..."); 
         WHEN Constraint_Error => 
            Skip_Line; 
            Put_Line("Enter a number 0-4.  Try again..."); 
      END; --exception handler 
   END LOOP; 
END Menu_Demo; 