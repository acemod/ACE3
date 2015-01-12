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

private ["_unit"];

_unit = _this select 0;

!([_unit] call AGM_Core_fnc_isPlayer 
|| {_unit in playableUnits}
|| {vehicle _unit != _unit} 
|| {_unit getVariable ["AGM_SwitchUnits_IsPlayerUnit", false]} 
|| {_unit getVariable ["AGM_SwitchUnits_IsPlayerControlled", false]})
