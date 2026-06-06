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

   PROCEDURE Support_Shooting IS
   BEGIN
      Put((7 * Bs) & "Shoot=>");
      Get_Immediate(Key);
      Put((7 * Bs) & "Move =>");
      CASE Key IS
         WHEN 's' | 'S' => -- left
            Shoot(0, -1);
         WHEN 'e' | 'E' => -- up
            Shoot(-1, 0);
         WHEN 'd' | 'D' => -- right
            Shoot(0, 1);
         WHEN 'x' | 'X' => -- down
            Shoot(1, 0);
         WHEN OTHERS =>
            NULL;
      END CASE;
   END Support_Shooting;

   PROCEDURE Check_Key_Pressed IS
   BEGIN
      CASE Key IS
         WHEN 's' | 'S' => -- left
            Move_Hunter(0, -1);
            Check_Hunter;
         WHEN 'd' | 'D' => -- right
            Move_Hunter(0, 1);
            Check_Hunter;
         WHEN 'e' | 'E' => -- up
            Move_Hunter(-1, 0);
            Check_Hunter;
         WHEN 'x' | 'X' => -- down
            Move_Hunter(1, 0);
            Check_Hunter;
         WHEN 'q' | 'Q' => -- quit game
            Put("Quit.");
            New_Line;
            End_Wumpus_Window;
            RETURN;
         WHEN 'k' | 'K' => -- shoot
            Support_Shooting;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END Check_Key_Pressed; 

   PROCEDURE Check_Hunter IS
      Cavern : Cavern_Type RENAMES World.Caverns(Hunter_Row, Hunter_Col);
   BEGIN
      CASE Hazard(World, Hunter_Row, Hunter_Col) IS
         WHEN Wumpus =>
            RAISE Hunter_Eaten;
         WHEN Slime_Pit =>
            RAISE Hunter_Eaten;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END Check_Hunter; 

   PROCEDURE Move_Hunter(Row_Change, Col_Change : IN Integer) IS
      New_Row : Cavern_Row_Type;
      New_Col : Cavern_Col_Type;
   BEGIN
      New_Row := Cavern_Row_Type(Integer(Hunter_Row) + Row_Change);
      New_Col := Cavern_Col_Type(Integer(Hunter_Col) + Col_Change);
      Draw_Cavern(World, Hunter_Row, Hunter_Col);
      Draw_Cavern(World, New_Row, New_Col);
      Draw_Hunter(New_Row, New_Col);
      Hunter_Row := New_Row;
      Hunter_Col := New_Col;
   EXCEPTION
      WHEN Constraint_Error =>
         Put(Bel);
   END Move_Hunter; 
   PROCEDURE Shoot(Row_Dir, Col_Dir : IN Integer) IS
   BEGIN
      CASE Hazard(World,
                  Cavern_Row_Type(Integer(Hunter_Row) + Row_Dir),
                  Cavern_Col_Type(Integer(Hunter_Col) + Col_Dir)) IS
         WHEN Wumpus    => RAISE Wumpus_Killed;
         WHEN OTHERS    => RAISE Hunter_Eaten; -- arrow wakes the wumpus
      END CASE;
   EXCEPTION
      WHEN Constraint_Error =>
         RAISE Hunter_Eaten; -- shot out of bounds still wakes the wumpus
   END Shoot; 

BEGIN  --Wumpus
   Create_Wumpus_Window;
   DECLARE
      Play_Choice : Character;
   BEGIN
      Put("Play? (y/n) > ");
      Get_Immediate(Play_Choice);
      New_Line;
      IF Play_Choice /= 'y' AND THEN Play_Choice /= 'Y' THEN
         End_Wumpus_Window;
         RETURN;
      END IF;
   END;
   LOOP  --Replay loop
      Clear_Wumpus_Window;
      Make_Random_Wumpus_World(World);
      BEGIN  --Exception
         Create_Hunter;
         Put("Move =>");
         LOOP  --Handles all movements
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
      DECLARE
         Again : Character;
      BEGIN
         Put("Play again? (y/n) > ");
         Get_Immediate(Again);
         New_Line;
         EXIT WHEN Again /= 'y' AND THEN Again /= 'Y';
      END;
   END LOOP;
   End_Wumpus_Window;
END Wumpus; 