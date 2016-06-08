/*
 * Author: voiper
 * Start lifetime timer for IR chemlight on server.
 *
 * Arguments:
 * 1: Chemlight phys object <OBJECT>
 * 2: Light marker vehicle <OBJECT>
 * 3: Time to live <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehX, _light, 500] call ace_chemlights_fnc_IRTimer;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_vehX", "_lightMarker", "_lifeTime"];

[FUNC(removeIR), [_vehX, _lightMarker], _lifeTime] call CBA_fnc_waitAndExecute;