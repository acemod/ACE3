/*
 * Author: PabstMirror
 * Helper function to get all gear of a container
 *
 * Arguments:
 * 0: Container <OBJECT>
 *
 * Return Value:
 * Array of 2 arrays, classnames and count<ARRAY>
 *
 * Example:
 * [["ace_bandage"],[2]] = [box] call ace_disarming_fnc_getAllGearContainer
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_target);

private ["_allGear"];

_allGear = [[],[]];

{
    (_allGear select 0) append (_x select 0);
    (_allGear select 1) append (_x select 1);
} forEach [(getWeaponCargo _target), (getItemCargo _target), (getMagazineCargo _target), (getBackpackCargo _target)];

_allGear
