/*
  Name: ACE_SwitchUnits_fnc_addMapFunction
  
  Author(s):
    bux578
  
  Description:
    Adds a mapClick Eventhandler
  
  Parameters:
    0: OBJECT - unit
    1: ARRAY<OBJECT> - sides
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_unit", "_sides"];
_unit = _this select 0;
_sides = _this select 1;

["theMapClick", "onMapSingleClick", {

    if (alive ACE_player && {GVAR(OriginalUnit) getVariable ["ACE_CanSwitchUnits", false]}) then {
        [_this, _pos, _shift, _alt] call FUNC(handleMapClick);
    };
  
}, [_unit, _sides]] call BIS_fnc_addStackedEventHandler;
