/*
 * Author: voiper
 * Start lifetime timer for IR chemlight on server.
 *
 * Arguments:
 * 1: Projectile or ammo classname <OBJECT>
 *
 * Return Value:
 * 1: Chemlight phys object <OBJECT>
 * 2: Light marker vehicle <OBJECT>
 * 3: Time to live <NUMBER>
 *
 * Example:
 * [_vehX, _light, 500] call ace_chemlights_fnc_isIRClass;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_vehX", "_lightMarker", "_lifeTime"];

[FUNC(removeIR), [_vehX, _lightMarker], _lifeTime] call CBA_fnc_waitAndExecute;