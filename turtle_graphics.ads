-- Turtle_Graphics package stub.
--
-- Original package by Tanya Markow, Eugene K. Ressler, and Jean R. S. Blair,
-- United States Military Academy (West Point).
-- "Catch that speeding turtle: latching onto fun graphics in CS1"
-- ACM SIGAda Ada Letters, Vol. XXVI, Issue 3, pp. 29-34, November 2006.
-- https://doi.org/10.1145/1185875.1185648
--
-- This is a no-op stub that allows dependent programs to compile and run
-- without a graphics window. All drawing calls are silently ignored.

PACKAGE Turtle_Graphics IS

   -- Alignment used for image placement in the overloaded Spot procedure.
   TYPE Alignment IS (Left, Center, Right, Top, Bottom);

   PROCEDURE Create_World (Width, Height : IN Float);
   -- Open a drawing window of the given pixel dimensions and show the turtle.

   PROCEDURE Clear;
   -- Erase everything currently drawn in the window.

   PROCEDURE Fly (X, Y : IN Float);
   -- Move the turtle to (X, Y) without drawing a line.

   PROCEDURE Walk (X, Y : IN Float);
   -- Move the turtle to (X, Y), drawing a line from the current position.

   PROCEDURE Erase (X, Y : IN Float);
   -- Move to (X, Y) and erase any mark at that position.

   PROCEDURE Spot (Filename : IN String);
   -- Place the image file centered at the current turtle position.

   PROCEDURE Spot (Filename : IN String;
                   Scale    : IN Float;
                   H_Align  : IN Alignment;
                   V_Align  : IN Alignment);
   -- Place the image file at the current position, scaled by Scale and
   -- aligned horizontally by H_Align and vertically by V_Align.

   PROCEDURE End_World;
   -- Close the drawing window.

END Turtle_Graphics;
