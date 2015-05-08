/*
 * Author: Winter
 * Returns the view distance value according to the given index
 * 
 *
 * Arguments:
 * 0: View Distance Index <SCALAR>
 *
 * Return Value:
 * View Distance <SCALAR>
 *
 * Example:
 * [2] call ace_viewdistance_fnc_returnViewDistanceValue;
 *
 * Public: Yes
 */

#include "script_component.hpp"

PARAMS_1(_index);

private ["_return"];
_return = 0;

// change to if () exitWith {};?
switch (_index) do
{
  case 0:   {_return = 1500;};
  case 1:   {_return = 2000;};
  case 2:   {_return = 2500;};
  case 3:   {_return = 3000;};
  case 4:   {_return = 3500;};
  case 5:   {_return = 4000;};
  case 6:   {_return = 5000;};
  case 7:   {_return = 6000;};
  case 8:   {_return = 7000;};
  case 9:   {_return = 8000;};
  case 10:  {_return = 9000;};
  case 11:  {_return = 10000;};
  default {hint "something broke!";}; // should replace with something a bit more graceful
};

_return;