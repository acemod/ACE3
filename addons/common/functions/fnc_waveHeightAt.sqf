#include "script_component.hpp"
/*
 * Author: jaynus
 * Gets the wave height at a specific location. Uses a logic, so may be performance iffy
 *
 * Arguments:
 * 0: Position ASL to get height at <ARRAY>
 *
 * Return Value:
 * Wave height in meters <NUMBER>
 *
 * Example:
 * [[5, 2, 5]]] call ace_common_fnc_waveHeightAt
 *
 * Public: No
 */

params ["_position"];

if (isNil QGVAR(waveHeightLogic)) then {
    GVAR(waveHeightLogic) = "Logic" createVehicleLocal [0,0,0];
};

GVAR(waveHeightLogic) setPosASL _position;

(getPosASLW GVAR(waveHeightLogic) select 2) - (getPosASL GVAR(waveHeightLogic) select 2)
