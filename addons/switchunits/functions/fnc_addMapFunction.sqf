/*
  Name: ACE_SwitchUnits_fnc_addMapFunction
  
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

#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;

["theMapClick", "onMapSingleClick", {
  [_this, _pos, _shift, _alt] call FUNC(handleMapClick);
}, [_unit, _sides]] call BIS_fnc_addStackedEventHandler;
