WITH Ada.Text_Io; USE Ada.Text_Io; 
WITH Ada.Float_Text_Io; USE Ada.Float_Text_Io; 

PROCEDURE Distance_Adder IS 
   PROCEDURE Calculate_Distance; 
   PROCEDURE Read_And_Compute_Sum; 
   PROCEDURE Read_And_Sum_One; 
   PROCEDURE Add_Number_Feet; 
   PROCEDURE Add_Number_Miles; 
   PROCEDURE Add_Number_Yards; 
   PROCEDURE Add_Number_Kilo; 
   PROCEDURE Display_Sum; 
   PROCEDURE Explain_Use; 

   Number, Distance_Sum : Float; 
   Unit : String(1..4); 
   -- To calculate_distance 
   -- Explain use of this program 
   -- Read_and_compute_sum 
   -- Display_sum 

   PROCEDURE Calculate_Distance IS 
   BEGIN 
      New_Line; 
      Read_And_Compute_Sum; 
      New_Line; 
      Display_Sum; 
      New_Line; 
   END Calculate_Distance; 

   PROCEDURE Read_And_Compute_Sum IS 
   BEGIN 
      Distance_Sum := 0.0; 
      WHILE Unit /= "stop" LOOP 
         Read_And_Sum_One; 
      END LOOP; 
   END Read_And_Compute_Sum; 
   -- To Read_and_compute_sum 
   -- Start distance_sum at zero 
   -- Repeatedly 
   -- Read_and_sum_one 
   -- Until unit = "stop" 

   PROCEDURE Read_And_Sum_One IS 
   BEGIN 
      New_Line; 
      Explain_Use; 
      New_Line; 
      Put("Enter the distance"); 
      New_Line; 
      Put(">"); 
      Get(Number); 
      New_Line; 
      Put("Enter the first four letter of the  unit: (feet, yard, mile, kilo)"); 
      New_Line; 
      Put(">"); 
      Get(Unit); 
      IF Unit = "feet" THEN 
         Add_Number_Feet; 
      ELSIF Unit = "yard" THEN 
         Add_Number_Yards; 
      ELSIF Unit = "mile" THEN 
         Add_Number_Miles; 
      ELSIF Unit = "kilo" THEN 
         Add_Number_Kilo; 
      ELSIF Unit = "stop" THEN 
         New_Line; 
         Display_Sum; 
      ELSE 
         New_Line; 
         Put("Level Fuenfzig ERROR"); 
         New_Line; 
      END IF; 
   END Read_And_Sum_One; 

   -- To Read_and_sum_one 
   -- Design this be decomposing it to use the procedures below. 
   -- You may design other intermediate procedures in addition to those below. 

   PROCEDURE Add_Number_Feet IS 
   BEGIN 
      Distance_Sum := Distance_Sum + (Number/3281.0); 
   END Add_Number_Feet; 
   -- To Add_number_feet 
   -- add number/3281.0 to distance_sum 

   PROCEDURE Add_Number_Yards IS 
   BEGIN 
      Distance_Sum := Distance_Sum + (Number/1093.0); 
   END Add_Number_Yards; 
   -- To Add_number_yards 
   -- add number/1093.0 to distance_sum 

   PROCEDURE Add_Number_Miles IS 
   BEGIN 
      Distance_Sum := Distance_Sum + (Number/0.62); 
   END Add_Number_Miles; 
   -- To Add_number_miles 
   -- add number/0.62 to distance_sum 

   PROCEDURE Add_Number_Kilo IS 
   BEGIN 
      Distance_Sum := Distance_Sum + Number; 
   END Add_Number_Kilo; 
   -- To Add_number_kilo 
   -- add number to distance_sum 

   PROCEDURE Display_Sum IS 
   BEGIN 
      New_Line; 
      Put(Distance_Sum); 
      Put(" Kilometers"); 
      New_Line; 
   END Display_Sum; 
   -- To Display_sum 
   -- Display distance_sum "kilometers" 

   PROCEDURE Explain_Use IS 
   BEGIN 
      Put("Enter number and unit repeatedly"); 
      New_Line; 
      Put("The number and unit are adjacent, there are no spaces"); 
      New_Line; 
      Put("The unit is feet, yards, miles, or kilo in lower case"); 
      New_Line; 
      Put("Enter 0 for number and stop for unit when finished"); 
      New_Line; 
   END Explain_Use; 
   -- To Explain_Use 
   -- Display "Enter number and unit repeatedly" 
   -- Display "The number and unit are adjacent, there are no spaces" 
   -- Display "The unit is feet, yards, miles, or kilo in lower case" 
   -- Display "Enter 0 for number and stop for unit when finished" 
BEGIN 
   Calculate_Distance; 
END Distance_Adder; 