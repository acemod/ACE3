/*
  Name: AGM_SwitchUnits_fnc_isValidAi
  
  Author(s):
    bux578
  
  Description:
    Checks if AI is a valid target for switching
  
  Parameters:
    0: OBJECT - unit
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

!([_unit] call EFUNC(Core, isPlayer)
|| {_unit in playableUnits}
|| {vehicle _unit != _unit} 
|| {_unit getVariable [QGVAR(IsPlayerUnit), false]} 
|| {_unit getVariable [QGVAR(IsPlayerControlled), false]})
