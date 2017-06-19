/*
 * Author: commy2
 *
 * Returns all damageable selections without hitpoints of any vehicle.
 *
 * Arguments:
 * 0: A vehicle, not the classname <OBJECT>
 *
 * Return Value:
 * The selections without hitpoints, i.e. reflectors. <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getSelectionsWithoutHitPoints
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

private _hitPointsFull = getAllHitPointsDamage _vehicle;

private _allSelectionsWithoutHitpoints = [];

{
    if (_x == "") then {
        _allSelectionsWithoutHitpoints pushBack (_hitPointsFull select 1 select _forEachIndex);
    };
} forEach (_hitPointsFull select 0);

_allSelectionsWithoutHitpoints
