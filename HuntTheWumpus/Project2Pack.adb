WITH Ada.Numerics.Discrete_Random; 
WITH Turtle_Graphics; USE Turtle_Graphics; 
WITH Ada.Text_IO; USE Ada.Text_IO; 

PACKAGE BODY Project2Pack IS 
   PACKAGE Random_Row_Pack IS NEW Ada.Numerics.Discrete_Random(Cavern_Row_Type); 
   PACKAGE Random_Col_Pack IS NEW Ada.Numerics.Discrete_Random(Cavern_Col_Type); 

   Row_Gen : Random_Row_Pack.Generator; 
   Col_Gen : Random_Col_Pack.Generator; 

   PROCEDURE Get_Random_Location(Row : OUT Cavern_Row_Type; Col : OUT Cavern_Col_Type) IS 
   BEGIN 
      Row := Random_Row_Pack.Random(Row_Gen);
      Col := Random_Col_Pack.Random(Col_Gen);
   END Get_Random_Location; 

   FUNCTION Hazard(World : IN Wumpus_World_Type; Row : IN Cavern_Row_Type; Col : IN Cavern_Col_Type) RETURN Hazard_Type IS 
   BEGIN 
      IF World.Caverns(Row,Col).Lair_Indicator = Lair THEN 
         RETURN Wumpus; 
      ELSE 
         RETURN None; 
      END IF; 
   END Hazard; 

   PROCEDURE Get_Random_Hunter_Location(World : IN Wumpus_World_Type; Row : OUT Cavern_Row_Type; Col : OUT Cavern_Col_Type) IS 
   BEGIN 
      LOOP 
         Get_Random_Location(Row, Col); 
         EXIT WHEN Hazard(World, Row, Col) = None; 
      END LOOP; 
   END Get_Random_Hunter_Location; 

   -- Slime_Count_Gen will hold a random number, 1 to 3 
   SUBTYPE Slime_Pit_Count_Type IS Positive RANGE 1..3; 

   PACKAGE Random_Slime_Count_Pack IS NEW Ada.Numerics.Discrete_Random(Slime_Pit_Count_Type); 
   Slime_Count_Gen : Random_Slime_Count_Pack.Generator; 

   PROCEDURE Make_Random_Wumpus_World(World : OUT Wumpus_World_Type) IS 
      N_Slime_Pits : Positive;  -- this should hold the number of slime pits that the Wumpus World has 
      Row : Cavern_Row_Type; 
      Col : Cavern_Col_Type; 

      -- remove pits and lair from previous game 
      PROCEDURE Initialize_World IS 
      BEGIN 
         FOR R IN 1..Cavern_Row_Type'Last LOOP 
            FOR C IN 1..Cavern_Col_Type'Last LOOP 
               World.Caverns(R,C).Lair_Indicator := Far_From_Lair; 
            END LOOP; 
         END LOOP; 
      END Initialize_World; 

      -- Flag caverns near the lair, ignore caverns that don't exist 
      PROCEDURE Set_Near_Lair(Row : IN Integer; Col : IN Integer) IS 
      BEGIN 
         IF Hazard(World, Row, Col) = None THEN 
            World.Caverns(Row, Col).Lair_Indicator := Near_Lair; 
         END IF; 
      EXCEPTION 
         WHEN Constraint_Error => NULL; 
      END Set_Near_Lair; 

      -- Put some slime pits in random locations 
      PROCEDURE Make_Slime_Pits IS 
      BEGIN 
         -- To implement this procedure, start with line below, then use Make_Lair as a guide 
         N_Slime_Pits := Random_Slime_Count_Pack.Random(Slime_Count_Gen); 
         -- N_Slime_Pits will be either 1, 2, or 3.  Make the same number of slime pits. 
      END Make_Slime_Pits; 

      -- Put the lair in a random location. 
      PROCEDURE Make_Lair IS 
      BEGIN 
         Get_Random_Location(Row, Col); 
         -- If you have added slime pits, check to see if the location you just got is already a slime pit before setting the Lair_Indicator.  If it is, get a different location first. 
         World.Caverns(Row, Col).Lair_Indicator := Lair; 
         FOR R IN 1..2 LOOP 
            Set_Near_Lair(Row + R, Col); 
            Set_Near_Lair(Row - R, Col); 
            Set_Near_Lair(Row, Col + R); 
            Set_Near_Lair(Row, Col - R); 
         END LOOP; 
      END Make_Lair; 

   BEGIN  --Make_Random_Wumpus_World 
      Initialize_World; 
      Make_Slime_Pits; 
      Make_Lair; 
   END Make_Random_Wumpus_World; 

   -- Procedures for creating a drawing window and drawing caverns. 
   Cavern_Size : CONSTANT := 50.0; -- must match cell.png 
   N_Rows : CONSTANT := 1 + Cavern_Row_Type'Last - Cavern_Row_Type'First; 
   N_Cols : CONSTANT := 1 + Cavern_Col_Type'Last - Cavern_Row_Type'First; 

   PROCEDURE Create_Wumpus_Window IS 
   BEGIN 
      Random_Slime_Count_Pack.Reset(Slime_Count_Gen, 1); 
      Random_Row_Pack.Reset(Row_Gen, 2); 
      Random_Col_Pack.Reset(Col_Gen, 3); 
      Create_World(Float(N_Cols) * Cavern_Size, Float(N_Rows) * Cavern_Size);      
    END Create_Wumpus_Window; 

   PROCEDURE Clear_Wumpus_Window IS 
   BEGIN 
      Clear; 
   END Clear_Wumpus_Window; 

   FUNCTION Convert_Row_To_Y(Row : IN Cavern_Row_Type) RETURN Float IS 
   BEGIN 
      RETURN Cavern_Size * (Float(Cavern_Row_Type'Last - Row) + 0.5); 
   END Convert_Row_To_Y; 

   FUNCTION Convert_Col_To_X(Col : IN Cavern_Col_Type) RETURN Float IS 
   BEGIN 
      RETURN Cavern_Size * (Float(Col - Cavern_Col_Type'First) + 0.5); 
   END Convert_Col_To_X; 

   PROCEDURE Draw_Cavern(World : IN Wumpus_World_Type; Row : IN Cavern_Row_Type; Col : IN Cavern_Col_Type) IS 
   BEGIN 
      Fly(Convert_Col_To_X(Col), Convert_Row_To_Y(Row)); 
      Spot("cell.png"); 
      CASE World.Caverns(Row, Col).Lair_Indicator IS 
         WHEN Lair => 
            Spot("lair.png"); 
         WHEN Near_Lair => 
            Spot("blood.png"); 
         WHEN Far_From_Lair => 
            NULL; 
      END CASE; 
   END Draw_Cavern; 

   PROCEDURE Draw_Hunter(Row : IN Cavern_Row_Type; Col : IN Cavern_Col_Type) IS 
   BEGIN 
      NULL; 
      -- Add commands to: 
      -- convert the row and colum to X,Y coordinates 
      -- fly to those coordinates 
      -- place the "hunter.png" icon at this location 
   END Draw_Hunter; 

   PROCEDURE End_Wumpus_Window IS 
   BEGIN 
      End_World; 
   END End_Wumpus_Window; 

END Project2Pack; 