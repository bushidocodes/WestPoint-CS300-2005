PACKAGE BODY Min_Max IS

   FUNCTION Minimum (Value1 : Integer; Value2 : Integer) RETURN Integer IS
   BEGIN
      IF Value1 < Value2 THEN
         RETURN Value1;
      ELSE
         RETURN Value2;
      END IF;
   END Minimum;

   FUNCTION Maximum (Value1 : Integer; Value2 : Integer) RETURN Integer IS
   BEGIN
      IF Value1 > Value2 THEN
         RETURN Value1;
      ELSE
         RETURN Value2;
      END IF;
   END Maximum;

END Min_Max;
