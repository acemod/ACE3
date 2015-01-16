// by commy2 and CAA-Picard

#include "script_component.hpp"

ACE_Modifier = 0;

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

// restore global fire teams for JIP
{
  _team = _x getVariable [QGVAR(assignedFireTeam), ""];
  if (_team != "") then {_x assignTeam _team};
} forEach allUnits;
