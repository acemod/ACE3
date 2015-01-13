/*
  Name: ACE_Respawn_fnc_initRallypoint
  
  Author(s):
    commy2
  
  Description:
    init code for rally points
  
  Parameters:
    0: OBJECT - rally
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_rallypoint", "_name"];

_rallypoint = _this select 0;

if (!local _rallypoint) exitWith {};

_name = typeOf _rallypoint;

if (isNil _name) then {
    missionNamespace setVariable [_name, _rallypoint];
    publicVariable _name;
} else {
    deleteVehicle _rallypoint;
    diag_log text "[ACE] Respawn: ERROR Multiple Rallypoints of same type.";
};
