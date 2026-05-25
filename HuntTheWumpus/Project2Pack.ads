-- Package specification for the Hunt the Wumpus world.
-- Originally provided as part of the West Point CS300 Project 2 skeleton.
-- Types and subprogram signatures inferred from Project2Pack.adb and Wumpus.adb.

PACKAGE Project2Pack IS

   -- Grid dimensions for the cavern map.
   SUBTYPE Cavern_Row_Type IS Integer RANGE 1 .. 8;
   SUBTYPE Cavern_Col_Type IS Integer RANGE 1 .. 8;

   -- State of a single cavern cell.
   TYPE Lair_Indicator_Type IS (Far_From_Lair, Near_Lair, Lair);

   TYPE Cavern_Type IS RECORD
      Lair_Indicator : Lair_Indicator_Type := Far_From_Lair;
   END RECORD;

   TYPE Caverns_Array_Type IS
     ARRAY (Cavern_Row_Type, Cavern_Col_Type) OF Cavern_Type;

   TYPE Wumpus_World_Type IS RECORD
      Caverns : Caverns_Array_Type;
   END RECORD;

   -- What hazard (if any) occupies a cavern.
   TYPE Hazard_Type IS (None, Wumpus);

   ---------------------------------------------------------------------------
   -- World queries
   ---------------------------------------------------------------------------

   FUNCTION Hazard (World : IN Wumpus_World_Type;
                    Row   : IN Cavern_Row_Type;
                    Col   : IN Cavern_Col_Type) RETURN Hazard_Type;

   ---------------------------------------------------------------------------
   -- Hunter placement
   ---------------------------------------------------------------------------

   PROCEDURE Get_Random_Location (Row : OUT Cavern_Row_Type;
                                  Col : OUT Cavern_Col_Type);

   PROCEDURE Get_Random_Hunter_Location (World : IN  Wumpus_World_Type;
                                         Row   : OUT Cavern_Row_Type;
                                         Col   : OUT Cavern_Col_Type);

   ---------------------------------------------------------------------------
   -- World generation
   ---------------------------------------------------------------------------

   PROCEDURE Make_Random_Wumpus_World (World : OUT Wumpus_World_Type);

   ---------------------------------------------------------------------------
   -- Window / drawing
   ---------------------------------------------------------------------------

   PROCEDURE Create_Wumpus_Window;
   -- Open the graphics window and seed the random number generators.

   PROCEDURE Clear_Wumpus_Window;
   -- Erase all drawings from the window.

   PROCEDURE Draw_Cavern (World : IN Wumpus_World_Type;
                          Row   : IN Cavern_Row_Type;
                          Col   : IN Cavern_Col_Type);
   -- Redraw a single cavern cell (without the hunter icon).

   PROCEDURE Draw_Hunter (Row : IN Cavern_Row_Type;
                          Col : IN Cavern_Col_Type);
   -- Draw the hunter icon at the given cell.

   PROCEDURE End_Wumpus_Window;
   -- Close the graphics window.

END Project2Pack;
