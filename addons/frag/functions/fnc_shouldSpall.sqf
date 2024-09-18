#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should cause spalling.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * Whether the round type could spall when hitting an object <BOOL>
 *
 * Example:
 * "B_556x45_Ball" call ace_frag_fnc_shouldSpall
 *
 * Public: No
 */

params ["_ammo"];

GVAR(shouldSpallCache) getOrDefaultCall [_ammo, {
    (_ammo call FUNC(getSpallInfo)) params ["_caliber", "_explosive", "_indirectHit"];

    _caliber >= 2.5 || (_explosive > 0 && _indirectHit >= 1) // return
}, true]
