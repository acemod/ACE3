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

params [["_unit", objNull, [objNull]]];

private _vehicle = objectParent _unit;

if (!isNull _vehicle && {!([_vehicle, _unit] call FUNC(isOpenSeat))}) exitWith { false };

private _coverage = 0;

private _eyePos = eyePos _unit;
private _z = [0,3] select (stance _unit == "PRONE");
private _positions = [
    [_eyePos, _eyePos vectorAdd [5, 0, _z], _unit],
    [_eyePos, _eyePos vectorAdd [-5, 0, _z], _unit],
    [_eyePos, _eyePos vectorAdd [0, 5, _z], _unit],
    [_eyePos, _eyePos vectorAdd [0, -5, _z], _unit]
];

{
    private _intersect = lineIntersectsSurfaces _x;
    if (_intersect isNotEqualTo []) then {
        _x set [1, _intersect select 0];
    } else {
        _x set [1, [_x#1,0,objNull]];
    };
    if ((_x#0) distance (_x#1#0) < 0.1) then {
        _coverage = _coverage + 1;
    } else {
        _coverage = _coverage + ([objectParent _unit, "VIEW", _x#1#2] checkVisibility [_x#0, _x#1#0]);
    };
} forEach _positions;
_coverage < ((count _positions) / 3)
