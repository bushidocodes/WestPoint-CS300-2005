WITH Ada.Text_Io; USE Ada.Text_Io; 
WITH Ada.Integer_Text_Io; USE Ada.Integer_Text_Io; 
WITH Ada.Float_Text_Io; USE Ada.Float_Text_Io; 
WITH Ada.Numerics.Elementary_Functions; 
USE Ada.Numerics.Elementary_Functions; 

WITH Min_Max; USE Min_Max; 

PROCEDURE Fk_Lsn11 IS 

   PROCEDURE P15 IS 
      --| SPECIFICATION 
      --| Write a program that prints a table of the values of 
      --|    N  N/2  2*N  N**2  N**3  2**N 
      --| for N between 1 and 20. 
   BEGIN 
      Put("          N          N/2          2N          N^2          N^3          2^N"); 
      FOR MyIndex IN 1 .. 20 
      LOOP 
            New_Line; 
            Put(MyIndex); 
            Put("  "); 
            Put(MyIndex/2); 
            Put("  "); 
            Put(MyIndex*2); 
            Put("  "); 
            Put(MyIndex**2); 
            Put("  "); 
            Put(MyIndex**3); 
            Put("  "); 
            Put(2**MyIndex); 
          END LOOP; 
      --| for N = 1,2,...,19,20 
      --|    display N  N/2  2*N  N**2  N**3  2**N 
      NULL; 
   END P15; 

   PROCEDURE P25 IS 
      C : Float; 
      F : Float; 

      --| SPECIFICATION: 
      --| Use the concept of counting to prepare a table for 
      --| temperatures in degrees centigrade and degrees fahrenheit 
      --| for the temperatures -40, -39, -38, ..., 98, 99, 100 centigrade. 
      --| ANALYSIS: 
      --| Use the conversion formula 
      --|     C degrees centigrade = ((9*C)/5)+32 degrees fahrenheit 
      --| PROGRAM VARIABLES 
      --|    C - a centigrade value 
      --|    F - a fahrenheit value 
   BEGIN 
      --| for I = -40, -39, ..., 99, 100 
      --|    convert integer I to floating point C 
      --|    compute F = ((9*C)/5)+32 
      --|    display C and F 
         Put("Celcius     Fahrenheit"); 
         FOR I IN -40 .. 100 
         LOOP 
            New_Line; 
            C := Float(I); 
            F := ((9.0 * C) / 5.0) + 32.0; 
            Put(C); 
            Put("           "); 
            Put(F); 
         END LOOP; 
      NULL; 
   END P25; 

   PROCEDURE P35 IS 
      --| SPECIFICATION: 
      --| With the world getting smaller and smaller it is a good idea to be able 
      --| to convert from the system of measure used in one country to that used 
      --| in another. Produce a table of kilometers from 0 to 9 and the corresponding 
      --| distances in feet, yards, and miles. 
      --| ANALYSIS: 
      --| If you know a distance in kilometers, call it kilo, then you can obtain 
      --| approximations to 
      --|     feet           as 3281.0 * kilo 
      --|     miles          as 0.62 * kilo 
      --|     yards          as 1093.0 * kilo 
      --| PROGRAM VARIABLES 
      --|    Kilo, Feet, Miles, Yards - values in the respective units 
      Feet : Float := 0.0; 
      Miles : Float := 0.0; 
      Yards : Float := 0.0; 
      Kilo : Float := 0.0; 
   BEGIN 
      --| display the header line 
      --| for N = 0, ..., 9 
      --|    convert N to a floating point number Kilo 
      --|    compute equivalent Feet, Miles, Yards 
      --|    display Kilo, Feet, Miles, Yards 
      Put("Kilometers     Feet          Miles         Yards"); 
      FOR N IN 1 .. 20 
      LOOP 
            New_Line; 
            Kilo := Float(N); 
            Feet := 3281.0 * Kilo; 
            Miles := 0.62 * Kilo; 
            Yards := 1093.0 * Kilo; 
            Put(Kilo); 
            Put("  "); 
            Put(Feet); 
            Put("  "); 
            Put(Miles); 
            Put("  "); 
            Put(Yards); 
          END LOOP; 
      NULL; 
   END P35; 

   PROCEDURE P45 IS 
      --| SPECIFICATION: 
      --| Modify the program below to read a number and then to read 
      --| that many numbers. 
      --| Display the minimum, the maximum, the average, 
      --| a count of how many are positive and how many 
      --| are negative, and display "more are positive" or "more are negative" 
      --| depending on which count is larger. 
      ------------------------------------------------------------------------| 
      --|| Finds and displays the minimum, maximum, and average 
      --|| of a list of data items. 
      --|| Author: Michael B. Feldman, The George Washington University 
      --|| Last Modified: July 1995 
      ------------------------------------------------------------------------| 

      Numvalues:    Positive;  -- input - the number of items to be averaged 
      Currentvalue: Integer;   -- the next data item to be added 
      Sum:          Integer;   -- program variable - the sum being accumulated 
      Smallest:     Integer;   -- output - minimum of the data values 
      Largest:      Integer;   -- output - maximum of the data values 
      Average:      Integer;   -- output - average of the data values 
      Numpos:       Integer := 0; 
      Numneg:       Integer := 0; 

   BEGIN  -- Min_Max_Average 
      -- Read the number of items to be averaged 
      Ada.Text_Io.Put(Item => 
         "Enter number (at least 1) of integer items to be averaged > "); 
      Ada.Integer_Text_Io.Get(Item => Numvalues); 
      Ada.Text_Io.New_Line; 
      -- Initialize program variables 
      Smallest := Integer'Last; 
      Largest := Integer'First; 
      Sum := 0; 
      -- Read each data item, add it to Sum, 
      -- and check if it is a new minimum or maximum 
      FOR Count IN 1 .. Numvalues LOOP 
         Ada.Text_Io.Put(Item => "Integer item no. "); 
         Ada.Integer_Text_Io.Put(Item => Count, Width => 1); 
         Ada.Text_Io.Put(Item => " > "); 
         Ada.Integer_Text_Io.Get(Item => Currentvalue); 
         Sum := Sum + Currentvalue; 
         Smallest := Min_Max.Minimum(Value1 => Smallest, Value2 => Currentvalue); 
         Largest  := Min_Max.Maximum(Value1 => Largest,  Value2 => Currentvalue); 
         IF Currentvalue > 0 THEN 
            Numpos := Numpos + 1; 
         END IF; 
         IF Currentvalue < 0 THEN 
            Numneg := Numneg + 1; 
         END IF; 
      END LOOP; 
      -- compute the average; since Sum and NumValues are integers, 
      -- the average is truncated, that is, the fractional part is discarded 
      Average := Sum / Numvalues; 

      -- Display the results 
      Ada.Text_Io.Put(Item => "The Smallest is "); 
      Ada.Integer_Text_Io.Put(Item => Smallest, Width => 1); 
      Ada.Text_Io.New_Line; 
      Ada.Text_Io.Put(Item => "The Largest is "); 
      Ada.Integer_Text_Io.Put(Item => Largest, Width => 1); 
      Ada.Text_Io.New_Line; 
      Ada.Text_Io.Put(Item => "The Average is "); 
      Ada.Integer_Text_Io.Put(Item => Average, Width => 1); 
      Ada.Text_Io.New_Line; 

      IF Numpos > Numneg THEN 
         Put("More positive than negative"); 
      END IF; 

      IF Numpos < Numneg THEN 
         Put("More negative than positive"); 
      END IF; 

   END P45; 

   Which : Natural; 

BEGIN 
   Put( "Procedure> " ); Get( Which ); 
   CASE Which IS 
      WHEN 15 => P15; 
      WHEN 25 => P25; 
      WHEN 35 => P35; 
      WHEN 45 => P45; 
      WHEN OTHERS => NULL; 
   END CASE; 
EXCEPTION 
   WHEN OTHERS => NULL; 
END Fk_Lsn11; 