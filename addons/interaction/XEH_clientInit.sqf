// by commy2 and CAA-Picard

if (!hasInterface) exitWith {};

AGM_Interaction_isOpeningDoor = false;
AGM_Dancing = false;

// restore global fire teams for JIP
{
  _team = _x getVariable ["AGM_assignedFireTeam", ""];
  if (_team != "") then {_x assignTeam _team};
} forEach allUnits;
