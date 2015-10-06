/*
 * Author: commy2
 *
 * Returns all damageable selections without hitpoints of any vehicle.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * The selections without hitpoints, i.e. reflectors. (Array)
 */
#include "script_component.hpp"

params ["_vehicle"];

private ["_hitPointsFull", "_allSelectionsWithoutHitpoints"];

_hitPointsFull = getAllHitPointsDamage _vehicle;

_allSelectionsWithoutHitpoints = [];

{
    if (_x == "") then {
        _allSelectionsWithoutHitpoints pushBack (_hitPointsFull select 1 select _forEachIndex);
    };
} forEach (_hitPointsFull select 0);

_allSelectionsWithoutHitpoints
