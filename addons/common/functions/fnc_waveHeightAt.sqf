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
 */

if(isNil QGVAR(waveHeightLogic)) then {
    GVAR(waveHeightLogic) = "Logic" createVehicleLocal [0,0,0];
};
GVAR(waveHeightLogic) setPosASL (_this select 0);

(((getPosASLW GVAR(waveHeightLogic)) select 2) -  ((getPosASL GVAR(waveHeightLogic)) select 2))