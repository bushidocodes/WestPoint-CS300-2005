PACKAGE Days_Enum IS
   TYPE Days IS (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);

   FUNCTION Get_Day RETURN Days;
   --Pre:  Today is unassigned
   --Post:  Today is assigned a value of one of the day of the week

   FUNCTION Find_Tomorrow (Today : Days) RETURN Days;
   --Pre:  Tomorrow is unassigned
   --Post:  Tomorrow is assigned based on the value of Today

   FUNCTION Get_Temperature RETURN Float;
   --Pre:  Temperature is unassigned
   --Post:  Temperature holds a value, presummed to be ^F

   FUNCTION Select_Activity (Temperature : Float) RETURN Boolean;
   --Pre:  An activity for tomorrow has not been selected
   --Post:  An activity recommendation, based on the temperature, is provided

   FUNCTION Get_Menu_Choice RETURN Natural;
   --Pre: Nothing displayed
   --Post: Menu is displayed, user is prompted to enter a choice, choice returned

   FUNCTION Valid_Temp (Temperature : Float) RETURN Boolean;
   --Pre: Temperature variable is not known to be valid input
   --Post:  True indicates a valid temperature (between 110^F and -20^F)
END Days_Enum;
