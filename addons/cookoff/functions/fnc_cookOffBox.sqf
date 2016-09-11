/*
 * Author: SilentSpike
 * Start a cook-off in the given ammo box.
 *
 * Arguments:
 * 0: Ammo box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box] call ace_cookoff_fnc_cookOffBox
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_box"];

if (_box getVariable [QGVAR(isCookingOff), false]) exitWith {};
_box setVariable [QGVAR(isCookingOff), true];

// Fire effect goes here, setDamage 1 at the end (boxes sink into ground so needs plenty of time for cookoff to occur)

// These functions are smart and do all the work
_box call FUNC(secondaryExplosions);
[_box, magazinesAmmo _box] call FUNC(detonateAmmunition);
