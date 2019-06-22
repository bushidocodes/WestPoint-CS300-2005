WITH Ada.Text_Io; USE Ada.Text_Io; 

WITH Ada.Integer_Text_Io; USE Ada.Integer_Text_Io; 

 

PROCEDURE Fuel_Estimation IS 
   PROCEDURE Calculate_Fuel; 
   PROCEDURE Get_And_Sum_That_Many_Hours; 
   PROCEDURE Get_And_Add_One_Tank; 
   PROCEDURE Get_One_Tank_Hours; 
   PROCEDURE Get_Number_Of_Tanks; 

   Number_Of_Tanks, Tank_Hours, Sum_Of_Hours, Gallons : Integer; 

   -- To Calculate_Fuel 
   -- Get_number_of_tanks 
   -- Get_and_sum_that_many_hours 
   -- Compute gallons =  sum_of_hours  *  55 gallons/hour 
   -- Display gallons 

   PROCEDURE Calculate_Fuel IS 
   BEGIN 
      Get_Number_Of_Tanks; 
      Get_And_Sum_That_Many_Hours; 
      Gallons := Sum_Of_Hours * 55; 
      Put( Gallons ); Put( " gallons " ); New_Line; 
   END Calculate_Fuel; 

   -- To Get_and_sum_that_many_hours 
   -- Start sum_of_hours at zero 
   -- Repeat Get_and_add_one_tank 
   -- Do this number_of_tanks many times 

   PROCEDURE Get_And_Sum_That_Many_Hours IS 
   BEGIN 
      Sum_Of_Hours := 0; 
      FOR I IN 1..Number_Of_Tanks LOOP 
         Get_And_Add_One_Tank; 
      END LOOP; 
   END Get_And_Sum_That_Many_Hours; 

   -- To Get_and_add_one_tank 
   -- Get_one_tank_hours 
   -- Add one_tank_hours to sum_of_hours 
   PROCEDURE Get_And_Add_One_Tank IS 
   BEGIN 
      Get_One_Tank_Hours; 
      Sum_Of_Hours := Sum_Of_Hours + Tank_Hours; 
   END Get_And_Add_One_Tank; 

   -- To Get_one_tank_hours 
   -- Get tank_hours 
   -- If tank_hours is not a positive number then make it zero 
   -- Else leave it unchanged 
   PROCEDURE Get_One_Tank_Hours IS 
   BEGIN 
      Put( "Enter hours of fuel needed for next tank> " ); 
      Get( Tank_Hours ); 
      IF Tank_Hours < 0 THEN Tank_Hours := 0; END IF; 
   EXCEPTION 
      WHEN OTHERS => 
         Tank_Hours := 0; 
         Skip_Line; 
   END Get_One_Tank_Hours; 

   -- To Get_number_of_tanks 
   -- Get number_of_tanks 
   -- If number_of_tanks is is not a positive number then make it zero 
   -- Else leave it unchanged 
   PROCEDURE Get_Number_Of_Tanks IS 
   BEGIN 
      Put( "Enter the number of tanks> " ); 
      Get( Number_Of_Tanks ); 
      IF Number_Of_Tanks < 0 THEN Number_Of_Tanks := 0; END IF; 
   EXCEPTION 
      WHEN OTHERS => 
         Number_Of_Tanks := 0; 
         Skip_Line; 
   END Get_Number_Of_Tanks; 

BEGIN 
   Calculate_Fuel; 
END Fuel_Estimation; 