WITH Ada.Text_Io; USE Ada.Text_Io; 
WITH Ada.Integer_Text_Io; USE Ada.Integer_Text_Io; 
WITH Ada.Float_Text_Io; USE Ada.Float_Text_Io; 
WITH Ada.Numerics.Elementary_Functions; 
USE Ada.Numerics.Elementary_Functions; 

PROCEDURE Distance_Red_Blue IS 
   Command_Name, Name_One, Name_Two : String( 1..5 ); 
   Alpha_X, Alpha_Y : Float := 0.0; 
   Bravo_X, Bravo_Y : Float := 0.0; 
   Red_X, Red_Y : Float := 0.0; 
   Blue_X, Blue_Y : Float := 0.0; 
   Blank : CONSTANT Character := ' '; 
 
   PROCEDURE Get_Char( Char : OUT Character ) IS 
   BEGIN 
      IF End_Of_Line THEN Char := Blank; ELSE Get( Char ); END IF; 
   END Get_Char; 

   PROCEDURE Read_String( S : OUT String ) IS 
      Char : Character; 
   BEGIN 
      LOOP 
         Get_Char( Char ); 
         IF Char /= Blank OR End_Of_Line THEN EXIT; END IF; 
      END LOOP; 
      FOR I IN S'Range LOOP 
         S(I) := Char; 
         IF Char /= Blank THEN Get_Char( Char ); END IF; 
      END LOOP; 
   END Read_String; 

   PROCEDURE Calculate_Distance;
   PROCEDURE Do_Distance_Between( X0,Y0,X1,Y1 : Float );
   PROCEDURE Do_Distance_Command;
   PROCEDURE Do_Distance_To( Position_X,Position_Y : Float );
   PROCEDURE Do_One_Command;
   PROCEDURE Do_The_Commands;
   PROCEDURE Read_And_Do_One_Command;
   PROCEDURE Read_One_Command;
   PROCEDURE Read_Position;
   PROCEDURE Read( Position_X,Position_Y : OUT Float );
   PROCEDURE Read_Two_Names;
   PROCEDURE Explain_Use;

   FUNCTION Distance( X0,Y0,X1,Y1 : Float ) RETURN Float;

   --    To Calculate_Distance
   --    Explain_use
   --    Do_the_commands
   PROCEDURE Calculate_Distance IS
   BEGIN
      Explain_Use;
      Do_The_Commands;
   END Calculate_Distance;

   --    To Do_the_commands
   --    Repeatedly
   --    Read_and_do_one_command
   --    Until command_name = "STOP"
   PROCEDURE Do_The_Commands IS
   BEGIN
      LOOP
         Read_And_Do_One_Command;
         IF Command_Name = "STOP " THEN EXIT; END IF;
      END LOOP;
   END Do_The_Commands;

   --    To Read_and_do_one_command
   --    Read_one_command
   --    Do_one_command
   PROCEDURE Read_And_Do_One_Command IS
   BEGIN
      Read_One_Command;
      Do_One_Command;
   END Read_And_Do_One_Command;

   --    To Read_one_command
   --    Display ">"
   --    Read command_name
   --    Read_position 
   PROCEDURE Read_One_Command IS
   BEGIN
      Put( "> " );
      Read_String( Command_Name );
      Read_Position;
      Skip_Line;
   END Read_One_Command; 

   --    To Read_position
   --    if command_name = "RED  " then Read(red_x,red_y)
   --    else if command_name = "BLUE " then Read(blue_x,blue_y)
   --    else if command_name = "ALPHA" then Read(alpha_x,alpha_y)
   --    else if command_name = "BRAVO" then Read(bravo_x,bravo_y)
   --    else if command_name = "DIFF " then Read_two_names 
   PROCEDURE Read_Position IS
   BEGIN
      IF Command_Name = "RED  " THEN
         Read( Red_X,Red_Y );
      ELSIF Command_Name = "BLUE " THEN
         Read( Blue_X,Blue_Y );
      ELSIF Command_Name = "ALPHA" THEN
         Read( Alpha_X,Alpha_Y );
      ELSIF Command_Name = "BRAVO" THEN
         Read( Bravo_X,Bravo_Y );
      ELSIF Command_Name = "DIFF " THEN
         Read_Two_Names;
      END IF;
   END Read_Position; 

   --    To Read( position_x,position_y )
   --    Get position_x
   --    Get position_y 
   PROCEDURE Read( Position_X,Position_Y : OUT Float ) IS
   BEGIN
      Get( Position_X );
      Get( Position_Y );
   EXCEPTION
      WHEN OTHERS =>
         Put_Line( "Error in numeric data, zero assumed" );
         Position_X := 0.0;
         Position_Y := 0.0;
   END Read; 

   --    To Read_two_names 
   --    Get name_one 
   --    Get name_two 
   PROCEDURE Read_Two_Names IS 
   BEGIN 
      Read_String( Name_One ); 
      Read_String( Name_Two ); 
   END Read_Two_Names; 

   --    To Do_one_command 
   --    if command_name = "RED  " then do nothing 
   --    else if command_name = "BLUE " then do nothing 
   --    else if command_name = "ALPHA" then do nothing 
   --    else if command_name = "BRAVO" then do nothing 
   --    else if command_name = "DIFF " then do_distance_command 
   --    else if command_name = "STOP" then do nothing 
   --    else display "command name not recognized, line ignored" 
   PROCEDURE Do_One_Command IS 
   BEGIN 
      IF Command_Name = "RED  " THEN NULL; 
      ELSIF Command_Name = "BLUE " THEN NULL; 
      ELSIF Command_Name = "ALPHA" THEN NULL; 
      ELSIF Command_Name = "BRAVO" THEN NULL; 
      ELSIF Command_Name = "DIFF " THEN Do_Distance_Command; 
      ELSIF Command_Name = "STOP " THEN NULL; 
      ELSE 
         Put( Command_Name ); Put_Line(" is not recognized, line ignored" );
      END IF;
   END Do_One_Command;

   --    To Do_distance_command
   --    if name_one = "RED  " then do_distance_to(red_x,red_y)
   --    else if name_one = "BLUE " then do_distance_to(blue_x,blue_y)
   --    else if name_one = "ALPHA" then do_distance_to(alpha_x,alpha_y)
   --    else if name_one = "BRAVO" then do_distance_to(bravo_x,bravo_y)
   --    else Display name_one " is not recognized"
   PROCEDURE Do_Distance_Command IS
   BEGIN
      IF Name_One = "RED  " THEN Do_Distance_To(Red_X,Red_Y);
      ELSIF Name_One = "BLUE " THEN Do_Distance_To(Blue_X,Blue_Y);
      ELSIF Name_One = "ALPHA" THEN Do_Distance_To(Alpha_X,Alpha_Y);
      ELSIF Name_One = "BRAVO" THEN Do_Distance_To(Bravo_X,Bravo_Y);
      ELSE Put(Name_One); Put_Line( " is not recognized" );
      END IF; 
   END Do_Distance_Command; 

   --    To Do_distance_to( position_x,position_y ) 
   --    if name_two = "RED  " then 
   --       do_distance_between(position_x,position_y,red_x,red_y) 
   --    else if name_two = "BLUE " then 
   --       do_distance_between(position_x,position_y,blue_x,blue_y) 
   --    else if name_two = "ALPHA" then 
   --       do_distance_between(position_x,position_y,alpha_x,alpha_y) 
   --    else if name_two = "BRAVO" then 
   --       do_distance_between(position_x,position_y,bravo_x,bravo_y) 
   --    else Display name_two " is not recognized"
   PROCEDURE Do_Distance_To( Position_X,Position_Y : Float ) IS 
   BEGIN
      IF Name_Two = "RED  " THEN
         Do_Distance_Between( Position_X,Position_Y,Red_X,Red_Y );
      ELSIF Name_Two = "BLUE " THEN
         Do_Distance_Between( Position_X,Position_Y,Blue_X,Blue_Y );
      ELSIF Name_Two = "ALPHA" THEN
         Do_Distance_Between( Position_X,Position_Y,Alpha_X,Alpha_Y );
      ELSIF Name_Two = "BRAVO" THEN
         Do_Distance_Between( Position_X,Position_Y,Bravo_X,Bravo_Y );
      ELSE
         Put( Name_Two ); Put_Line( " is not recognized" );
      END IF;
   END Do_Distance_To; 

   --    To Do_distance_between( x0,y0,x1,y1 )
   --    Compute distance( x0,y0,x1,y1 ) and assign to Distance_between
   --    Display Distance_between
   --     " is the distance between " name_one " and " name_two
   PROCEDURE Do_Distance_Between( X0,Y0,X1,Y1 : Float ) IS
      Distance_Between : Float;
   BEGIN
      Distance_Between := Distance( X0,Y0,X1,Y1 );
      Put( Distance_Between,1,2,0 );
      Put( " is the distance between " );
      Put( Name_One ); Put( " and " ); Put( Name_Two );
      New_Line;
   END Do_Distance_Between; 

   --    To Compute distance( x0,y0,x1,y1 ) 
   --    Return sqrt( (x0-x1)**2 + (y0-y1)**2 ) 
   FUNCTION Distance( X0,Y0,X1,Y1 : Float ) RETURN Float IS
   BEGIN
      RETURN Sqrt( (X0-X1)**2 + (Y0-Y1)**2 );
   END Distance; 

   --    To Explain_use
   --    Display "When prompted by >, enter command and position"
   --    Display "  RED <x> <y> sets the base location to (x,y)
   --    Display "  BLUE <x> <y> sets the here location to (x,y)
   --    Display "  ALPHA <x> <y> sets the base location to (x,y)
   --    Display "  BRAVO <x> <y> sets the here location to (x,y)
   --    Display "  DIFF<one> <two> shows the distance from <one> to <two>"
   --    Display "  STOP stops the program"
   --    Display "where <x> and <y> represented decimal coordinate numbers"
   --    Display "and <one> and <two> are each RED or BLUE or ALPHA or BRAVO" 
   PROCEDURE Explain_Use IS 
   BEGIN 
      Put_Line( "When prompted by >, enter command and parameters" );
      Put_Line( "  RED <x> <y> sets the base location to (x,y)" );
      Put_Line( "  BLUE <x> <y> sets the here location to (x,y)" );
      Put_Line( "  ALPHA <x> <y> sets the base location to (x,y)" );
      Put_Line( "  BRAVO <x> <y> sets the here location to (x,y)" );
      Put_Line( "  DIFF <one> <two> shows distance from <one> to <two>" );
      Put_Line( "  STOP stops the program" );
      Put_Line( "where <x> and <y> represented decimal coordinate numbers" );
      Put_Line( "and <one> and <two> are RED or BLUE or ALPHA or BRAVO" );
      New_Line;
   END Explain_Use;
BEGIN
   Calculate_Distance; 
END Distance_Red_Blue; 