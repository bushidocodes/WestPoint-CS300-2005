-- Min_Max package from "Ada 95: Problem Solving and Program Design"
-- by Michael B. Feldman, The George Washington University.
-- Last Modified: July 1995

PACKAGE Min_Max IS

   FUNCTION Minimum (Value1 : Integer; Value2 : Integer) RETURN Integer;
   -- Pre:  Value1 and Value2 have been assigned values.
   -- Post: Returns the smaller of Value1 and Value2.

   FUNCTION Maximum (Value1 : Integer; Value2 : Integer) RETURN Integer;
   -- Pre:  Value1 and Value2 have been assigned values.
   -- Post: Returns the larger of Value1 and Value2.

END Min_Max;
