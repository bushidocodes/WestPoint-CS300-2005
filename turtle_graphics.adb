WITH Ada.Text_IO;

PACKAGE BODY Turtle_Graphics IS

   PROCEDURE Create_World (Width, Height : IN Float) IS
   BEGIN
      Ada.Text_IO.Put_Line
        ("[Turtle_Graphics stub] window " &
         Float'Image (Width) & " x" & Float'Image (Height) & " (no-op)");
   END Create_World;

   PROCEDURE Clear IS
   BEGIN
      NULL;
   END Clear;

   PROCEDURE Fly (X, Y : IN Float) IS
   BEGIN
      NULL;
   END Fly;

   PROCEDURE Walk (X, Y : IN Float) IS
   BEGIN
      NULL;
   END Walk;

   PROCEDURE Erase (X, Y : IN Float) IS
   BEGIN
      NULL;
   END Erase;

   PROCEDURE Spot (Filename : IN String) IS
   BEGIN
      NULL;
   END Spot;

   PROCEDURE Spot (Filename : IN String;
                   Scale    : IN Float;
                   H_Align  : IN Alignment;
                   V_Align  : IN Alignment) IS
   BEGIN
      NULL;
   END Spot;

   PROCEDURE End_World IS
   BEGIN
      NULL;
   END End_World;

END Turtle_Graphics;
