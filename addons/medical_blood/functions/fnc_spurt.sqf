/*
 * Author: Sickboy
 * Spurt blood on the ground
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: direction <NUMBER>
 * 2: damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [UNIT, random 360, 1] call ace_medical_blood_fnc_spawnBlood
 *
 * Public: No
 */

#include "script_component.hpp"

#define MAXIMUM_DROPS 4
#define DISTANCE_BETWEEN_DROPS 0.20
#define OFFSET 0.25

params ["_unit", "_dir", "_damage"];

private _pos = getPosATL _unit;
private _distanceBetweenDrops = DISTANCE_BETWEEN_DROPS * _damage;
private _offSet = OFFSET + _distanceBetweenDrops;
private _sinDir = sin _dir;
private _cosDir = cos _dir;

_pos params ["_x", "_y"];

private _bloodPos = [_x + (_sinDir * _offSet), _y + (_cosDir * _offSet), 0];
["ACE_Blooddrop_2", _bloodPos, _dir] call FUNC(spawnBlood);

if (ceil (MAXIMUM_DROPS * _damage) > 1) then {
    private _sin = _sinDir * _distanceBetweenDrops;
    private _cos = _cosDir * _distanceBetweenDrops;

    for "_i" from 2 to _c do {
        _bloodPos params ["_x", "_y"];
        _bloodPos = [_x + _sin, _y + _cos, 0];
        ["ACE_Blooddrop_1", _bloodPos, _dir] call FUNC(spawnBlood);
    };
};
