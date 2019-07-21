#include "script_component.hpp"
/*
 * Author: Sickboy
 * Spurts blood on the ground based on the direction and damage.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Direction <NUMBER>
 * 2: Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, random 360, 1] call ace_medical_blood_fnc_spurt
 *
 * Public: No
 */

#define MAXIMUM_DROPS 4
#define DISTANCE_BETWEEN_DROPS 0.20
#define OFFSET 0.25

params ["_unit", "_direction", "_damage"];

private _distanceBetweenDrops = DISTANCE_BETWEEN_DROPS * _damage;
private _offset = OFFSET + _distanceBetweenDrops;
private _position = _unit getPos [_offset, _direction];

["blooddrop_2", _position, _direction] call FUNC(createBlood);

private _dropAmount = ceil (MAXIMUM_DROPS * _damage);
TRACE_2("Spurting blood",_dropAmount,_damage);

if (_dropAmount > 1) then {
    for "_i" from 2 to _dropAmount do {
        _position = _position getPos [_distanceBetweenDrops, _direction];
        ["blooddrop_1", _position, _direction] call FUNC(createBlood);
    };
};
