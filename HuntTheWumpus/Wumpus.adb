WITH Ada.Text_IO; USE Ada.Text_IO; 
WITH Project2Pack; USE Project2Pack; 
WITH Ada.Characters.Latin_1; USE Ada.Characters.Latin_1; 
WITH Ada.Strings.Fixed; USE Ada.Strings.Fixed; 

PROCEDURE Wumpus IS 
   Key : Character; 
   World : Wumpus_World_Type; 
   Hunter_Row : Cavern_Row_Type; 
   Hunter_Col : Cavern_Col_Type; 
   Hunter_Eaten, Wumpus_Killed : EXCEPTION; 

   -- Procedure specifications: 
   PROCEDURE Create_Hunter; 
   PROCEDURE Support_Shooting; 
   PROCEDURE Check_Key_Pressed; 
   PROCEDURE Check_Hunter; 
   PROCEDURE Move_Hunter(Row_Change, Col_Change : IN Integer); 
   PROCEDURE Shoot(Row_Dir, Col_Dir : IN Integer); 

   -- Do not modify!  This procedure is done. 
   -- However, you need to finish Draw_Hunter. 
   PROCEDURE Create_Hunter IS 
   BEGIN 
      Get_Random_Hunter_Location(World, Hunter_Row, Hunter_Col); 
      Draw_Cavern(World, Hunter_Row, Hunter_Col); 
      Draw_Hunter(Hunter_Row, Hunter_Col); 
      Check_Hunter; 
   END Create_Hunter; 

   -- Incomplete:  see comments within 
   PROCEDURE Support_Shooting IS 
   BEGIN 
      Put((7 * Bs) & "Shoot=>"); 
      Get_Immediate(Key); 
      Put((7 * Bs) & "Move =>"); 
      CASE Key IS 
         WHEN 's' | 'S' => -- left 
            Shoot(0, -1); 
         -- Add necessary code 
         WHEN OTHERS => 
            NULL; 
      END CASE; 
   END Support_Shooting; 

   -- Incomplete:  see comments within 
   PROCEDURE Check_Key_Pressed IS 
   BEGIN 
      CASE Key IS 
         WHEN 's' | 'S' => -- left 
            Move_Hunter(0, -1); 
            Check_Hunter; 
         WHEN 'd' | 'D' => -- right 
            -- Add necessary code 
            NULL; 
         WHEN 'e' | 'E' => -- up 
            -- Add necessary code 
            NULL; 
         WHEN 'x' | 'X' => -- down 
            -- Add necessary code 
            NULL; 
         WHEN 'q' | 'Q' => -- quit game 
            Put("Quit."); 
            New_Line; 
            End_Wumpus_Window; 
            RETURN; 
         WHEN 'k' | 'K' => 
            -- Add necessary code 
            NULL; 
         WHEN OTHERS => 
            NULL; 
      END CASE; 
   END Check_Key_Pressed; 

   -- Do not modify!  This procedure is done. 
   PROCEDURE Check_Hunter IS 
      Cavern : Cavern_Type RENAMES World.Caverns(Hunter_Row, Hunter_Col); 
   BEGIN 
      CASE Hazard(World, Hunter_Row, Hunter_Col) IS 
         WHEN Wumpus => 
            RAISE Hunter_Eaten; 
         WHEN OTHERS => 
            NULL; 
      END CASE; 
   END Check_Hunter; 

   -- Incomplete:  see comments within 
   PROCEDURE Move_Hunter(Row_Change, Col_Change : IN Integer) IS 
      New_Row : Cavern_Row_Type; 
      New_Col : Cavern_Col_Type; 
   BEGIN 
      -- calculate new location based on changes, perhaps generating a range error 
      -- (complete): draw old location without hunter, reveals new location, draws hunter in  new location 
      Draw_Cavern(World, Hunter_Row, Hunter_Col); 
      Draw_Cavern(World, New_Row, New_Col); 
      Draw_Hunter(New_Row, New_Col); 
 
      --(complete): stores new row and column as the hunter location 
      Hunter_Row := New_Row; 
      Hunter_Col := New_Col; 
   EXCEPTION 
      WHEN Constraint_Error => 
         Put(Bel); 
   END Move_Hunter; 
   -- Incomplete:  see comment within 
   PROCEDURE Shoot(Row_Dir, Col_Dir : IN Integer) IS 
   BEGIN 
      -- To choose the appropriate condition, check the Hazard function for the cavern that the arrow will shoot into.  Only two outcomes are possible:  RAISE Wumpus_Killed or RAISE Hunter_Eaten 
      NULL; 
   EXCEPTION 
      WHEN Constraint_Error => 
         RAISE Hunter_Eaten; -- shot out of bounds still wakes the wumpus 
   END Shoot; 

-- Incomplete:  see comments within 
BEGIN  --Wumpus 
   Create_Wumpus_Window; 
   --Ask "Play or Quit?" here 
   Clear_Wumpus_Window;  -- Makes a fresh window 
   Make_Random_Wumpus_World(World); 
   BEGIN  --Exception 
      Create_Hunter;  -- Puts hunter at a fresh location and draw her. 
      Put("Move =>"); 
      LOOP   --Handles all movenments 
         Get_Immediate(Key); 
         Check_Key_Pressed; 
      END LOOP; 
   EXCEPTION 
      WHEN Hunter_Eaten => 
         New_Line; 
         Put("Hunter has been eaten by the wumpus."); 
         New_Line; 
      WHEN Wumpus_Killed => 
         New_Line; 
         Put("Yahoo! You slayed the wumpus!"); 
         New_Line; 
   END;  --Exception 
   End_Wumpus_Window; 
END Wumpus; 