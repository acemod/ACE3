/*
Name: GVAR(fnc_getForceWalkStatus)

Author: Pabst Mirror (from captivity by commy2)

Description:
  Returns reasons why the unit is forceWalk-ing, empty if not forced.

Parameters:
  0: OBJECT - Unit

Returns:
  ARRAY(of strings) - Reason why the unit is force walking

Example:
  [AGM_Player] call GVAR(fnc_getForceWalkStatus)
*/

private ["_unit", "_forceWalkReasons", "_unitForceWalkNumber", "_unitForceWalkStatus", "_unitForceWalkReasons"];

_unit = _this select 0;

_forceWalkReasons = missionNamespace getVariable ["AGM_forceWalkReasons", []];

_unitForceWalkNumber = _unit getVariable ["AGM_forceWalkStatusNumber", 0];

_unitForceWalkStatus = [_unitForceWalkNumber, count _forceWalkReasons] call GVAR(fnc_binarizeNumber);

_unitForceWalkReasons = [];
{
  if (_unitForceWalkStatus select _forEachIndex) then {
    _unitForceWalkReasons pushBack _x;
  };
} forEach _forceWalkReasons;

_unitForceWalkReasons
