/*
Name: FUNC(getForceWalkStatus)

Author: Pabst Mirror (from captivity by commy2)

Description:
  Returns reasons why the unit is forceWalk-ing, empty if not forced.

Parameters:
  0: OBJECT - Unit

Returns:
  ARRAY(of strings) - Reason why the unit is force walking

Example:
  [ACE_Player] call FUNC(getForceWalkStatus)
*/
#include "script_component.hpp"

private ["_forceWalkReasons", "_unitForceWalkNumber", "_unitForceWalkStatus", "_unitForceWalkReasons"];

params ["_unit"];

_forceWalkReasons = missionNamespace getVariable ["ACE_forceWalkReasons", []];

_unitForceWalkNumber = _unit getVariable ["ACE_forceWalkStatusNumber", 0];

_unitForceWalkStatus = [_unitForceWalkNumber, count _forceWalkReasons] call FUNC(binarizeNumber);

_unitForceWalkReasons = [];
{
    if (_unitForceWalkStatus select _forEachIndex) then {
        _unitForceWalkReasons pushBack _x;
    };
} forEach _forceWalkReasons;

_unitForceWalkReasons
