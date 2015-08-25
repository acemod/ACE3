/*
 * Author: PabstMirror, commy2
 * Returns reasons why the unit is forceWalk-ing.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Force Walk reasons <ARRAY>
 *
 * Example:
 * [ACE_Player] call ace_common_fnc_getForceWalkStatus
 *
 * Public: No
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
