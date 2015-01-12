/*
  Name: AGM_SwitchUnits_fnc_handleMapClick
  
  Author(s):
    bux578
  
  Description:
    Finds the clicked unit
  
  Parameters:
    0: OBJECT - MapClickEventHandlerArgs
      0: OBJECT - unit to switch to
      1: ARRAY<OBJECT> - sides
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_args", "_currentPlayerUnit", "_sides", "_pos", "_sideNearest"];

_currentPlayerUnit = (_this select 0) select 0;
_sides = (_this select 0) select 1;
_pos = _this select 1;

_sideNearest = [];

{
  if ([_x] call FUNC(isValidAi) && (side group _x in _sides)) then {
    _sideNearest pushBack _x;
  };
} forEach (nearestObjects [_pos, ["Man"], 20]);


if (count _sideNearest > 0) then {
  private ["_switchUnit"];
  
  _switchUnit = _sideNearest select 0;
  [_currentPlayerUnit, _switchUnit] call FUNC(switchUnit);
  
  openMap false;
};
