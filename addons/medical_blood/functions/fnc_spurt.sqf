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
 * [UNIT, random 360, 1] call ace_medical_blood_fnc_spurt
 *
 * Public: No
 */

#include "script_component.hpp"

#define MAXIMUM_DROPS 4
#define DISTANCE_BETWEEN_DROPS 0.20
#define OFFSET 0.25

params ["_unit", "_dir", "_damage"];
_damage = _damage min 1;

private _distanceBetweenDrops = DISTANCE_BETWEEN_DROPS * _damage;
private _offset = OFFSET + _distanceBetweenDrops;
private _pos = _unit getPos [_offset, _dir];
["blooddrop_2", _pos, _dir] call FUNC(createBlood);

private _dropAmount = ceil (MAXIMUM_DROPS * _damage);
if (_dropAmount > 1) then {
    for "_i" from 2 to _dropAmount do {
        _pos = _pos getPos [_distanceBetweenDrops, _dir];
        ["blooddrop_1", _pos, _dir] call FUNC(createBlood);
    };
};
