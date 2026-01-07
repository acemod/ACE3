#include "..\script_component.hpp"
/*
 * Author: BrettMayson
 * Check if a unit is in smoke (or any thick particle effect that has `blockAIVisibility`)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is the unit in smoke? <BOOL>
 *
 * Example:
 * [player] call ace_smoke_fnc_isInSmoke
 *
 * Public: Yes
 */

params ["_unit"];

private _coverage = 0;

private _eyePos = eyePos _unit;
private _positions = [
    [_eyePos, _eyePos vectorAdd [5, 0, 0], _unit],
    [_eyePos, _eyePos vectorAdd [-5, 0, 0], _unit],
    [_eyePos, _eyePos vectorAdd [0, 5, 0], _unit],
    [_eyePos, _eyePos vectorAdd [0, -5, 0], _unit]
];

{
    private _intersect = lineIntersectsSurfaces _x;
    if (_intersect isNotEqualTo []) then {
        _x set [1, _intersect select 0 select 0];
    };
    // Check visibility can return 0 for really close surfaces
    if ((_x#0) distance (_x#1) < 0.05) then {
        _coverage = _coverage + 1;
    } else {
        _coverage = _coverage + ([objNull, "VIEW"] checkVisibility [_x#0, _x#1]);
    };
} forEach _positions;

_coverage < ((count _positions) / 2)
