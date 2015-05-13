/*
  Name: FUNC(toNumber)

  Author(s):
    Garth de Wet (LH)

  Description:
    Takes a string/number and returns the number.

  Parameters:
    0: TYPE - Value to attempt to convert to number or if number simply return number.

  Returns:
    NUMBER

  Example:
    number = ["102"] call FUNC(toNumber);
*/
#include "script_component.hpp"

if (typeName (_this select 0) == "SCALAR") exitWith {
  (_this select 0)
};

(parseNumber (_this select 0))