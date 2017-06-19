/*
 * Author: Glowbal
 * Handle unit hit eventhandler
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: caused by <OBJECT>
 * 2: damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, 5] call ACE_medical_blood_fnc_hit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_causedBy", "_damage"];

if (((vehicle _unit) != _unit) && {!((vehicle _unit) isKindOf "StaticWeapon")}) exitWith {}; // Don't bleed on ground if mounted

if (isNull _causedBy) exitWith { // won't be able to calculate the direction properly, so instead we pick something at random
    [QGVAR(spurt), [_unit, random 360, _damage]] call CBA_fnc_serverEvent;
};

// Calculate bulletDirection
private _bulletDir = _unit getDir _causedBy;

[QGVAR(spurt), [_unit, _bulletDir, _damage]] call CBA_fnc_serverEvent;
