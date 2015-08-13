/*
 * Author: jaynus
 *
 * Gets the wave height at a specific location. Uses a logic, so may be performance iffy
 *
 * Arguments:
 * 0: Position ASL to get height at
 *
 * Return Value:
 * Wave height in meters
 *
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_position"];

if(isNil QGVAR(waveHeightLogic)) then {
    GVAR(waveHeightLogic) = "Logic" createVehicleLocal [0,0,0];
};
GVAR(waveHeightLogic) setPosASL _position;

params ["", "", "_waveHight"];

((getPosASLW _waveHight) -  (getPosASL _waveHight))
