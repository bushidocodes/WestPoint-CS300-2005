WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Days_Enum; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Days_Enum; 

PROCEDURE Activity_Planner IS 
   Menu_Choice : Natural := 0; 
   Today : Days; 
   Tomorrow : Days; 
   Temperature : Float := -100.0; 
   Selected : Boolean := False; 

BEGIN 
   WHILE Menu_Choice /= 5 LOOP 
      New_Line; 
      Menu_Choice := Get_Menu_Choice; 
      New_Line; 
      CASE Menu_Choice IS 
         WHEN 1 => 
            Today := Get_Day; 
         WHEN 2 => 
            Tomorrow := Find_Tomorrow(Today); 
         WHEN 3 => 
            Temperature := Get_Temperature; 
            Selected := True; 
         WHEN 4 => 
            IF NOT Selected THEN 
               Temperature := Get_Temperature; 
               Selected := Select_Activity(Temperature); 
            ELSE 
               Selected := Select_Activity(Temperature); 
            END IF; 
         WHEN 5 => 
            Put_Line("Goodbye!"); 
         WHEN OTHERS => 
            Put_Line("Invalid choice!  Try again."); 
      END CASE; 
   END LOOP; 
END Activity_Planner; 

WITH Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 
USE Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO; 
PACKAGE BODY Days_Enum IS 
   PACKAGE Days_IO IS NEW Enumeration_IO(Days); 
   FUNCTION Get_Day RETURN Days IS 
      Today : Days; 
   BEGIN 
      Put("What is today? >");
      Days_IO.Get(Today); 
      New_Line; 
      RETURN Today; 
   END Get_Day; 

   FUNCTION Find_Tomorrow (Today : Days)  RETURN Days IS 
      Tomorrow : Days; 
   BEGIN 
      IF Today = Days'Last THEN 
         Tomorrow := Days'First; 
      ELSE 
         Tomorrow := Days'Succ(Today); 
      END IF; 
      Put("Tomorrow is "); 
      Days_IO.Put(Tomorrow); 
      New_Line; 
      RETURN Tomorrow; 
   END Find_Tomorrow; 

   FUNCTION Get_Temperature RETURN Float IS 
      Temperature : Float; 
   BEGIN 
      Put("What is the forecasted temperature for tomorrow? >"); 
      Get(Temperature); 
      New_Line; 
      RETURN Temperature; 
   END Get_Temperature; 

   FUNCTION Valid_Temp (Temperature : Float) RETURN Boolean IS 
      Valid : Boolean; 
   BEGIN 
      IF (Temperature > 110.0) OR (Temperature < -20.0) THEN 
        Put_Line("Temperatures are in ^F (between 110 and -20)."); 
        Valid := False; 
      ELSE 
         Valid := True; 
      END IF; 
      RETURN Valid; 
   END Valid_Temp; 

   FUNCTION Select_Activity (Temperature : Float) RETURN Boolean IS 
      Selected : Boolean; 
   BEGIN 
      IF NOT Valid_Temp(Temperature) THEN 
         Selected := False; 
      ELSE 
         Put("Recommended activity is to "); 
         IF (Temperature <= 110.0) AND (Temperature >= 90.0) THEN 
            Put_Line("go swimming."); 
         ELSIF (Temperature < 90.0) AND (Temperature >= 65.0) THEN 
            Put_Line("go hiking."); 
         ELSIF (Temperature < 65.0) AND (Temperature >= 30.0) THEN 
            Put_Line("watch a movie."); 
         ELSIF (Temperature >= -20.0) THEN 
            Put_Line("go skiing."); 
         END IF; 
         Selected := True; 
      END IF; 
      RETURN Selected; 
   END Select_Activity; 

   FUNCTION Get_Menu_Choice RETURN Natural IS 
      Choice : Natural; 
   BEGIN 
      Put_Line("Menu choices:"); 
      Put_Line("1) Enter Day"); 
      Put_Line("2) Find Tomorrow"); 
      Put_Line("3) Enter Temperature"); 
      Put_Line("4) Select Activity"); 
      Put_Line("5) Quit"); 
      New_Line; 
      Put("Enter your choice >"); 
      Get(Choice); 
      RETURN Choice; 
   END Get_Menu_Choice; 

END Days_Enum; 

PACKAGE Days_Enum IS 
   TYPE Days IS (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday); 
  -- PACKAGE Days_IO IS NEW Enumeration_IO(Days); 

   FUNCTION Get_Day RETURN Days; 
   --Pre:  Today is unassigned 
   --Post:  Today is assigned a value of one of the day of the week 

   FUNCTION Find_Tomorrow (Today : Days) RETURN Days; 
   --Pre:  Tomorrow is unassigned
   --Post:  Tomorrow is assigned based on the value of Today

   FUNCTION Get_Temperature RETURN Float; 
   --Pre:  Temperature is unassigned 
   --Post:  Temperature holds a value, presummed to be ^F 

   FUNCTION Select_Activity (Temperature : Float) RETURN Boolean; 
   --Pre:  An activity for tomorrow has not been selected 
   --Post:  An activity recommendation, based on the temperature, is provided 

   FUNCTION Get_Menu_Choice RETURN Natural; 
   --Pre: Nothing displayed 
   --Post: Menu is displayed, user is prompted to enter a choice, choice returned 

   FUNCTION Valid_Temp (Temperature : Float) RETURN Boolean; 
   --Pre: Temperature variable is not known to be valid input 
   --Post:  True indicates a valid temperature (between 110^F and -20^F) 
END Days_Enum; 