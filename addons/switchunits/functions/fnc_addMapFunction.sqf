/*
  Name: AGM_SwitchUnits_fnc_addMapFunction
  
  Author(s):
    bux578
  
  Description:
    Adds a mapClick Eventhandler
  
  Parameters:
    0: OBJECT - unit
    1: ARRAY<OBJECT> - sided
  
  Returns:
    VOID
*/

private ["_unit"];
_unit = _this select 0;

["theMapClick", "onMapSingleClick", {
  [_this, _pos, _shift, _alt] call AGM_SwitchUnits_fnc_handleMapClick;
}, [_unit, _sides]] call BIS_fnc_addStackedEventHandler;
