#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initialise joystick
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_initJoystick
 *
 * Public: No
 */
params ["_joystick"];

// each plug has information regarding the current launcher which is connected
// if null, no launcher is connected
_joystick setVariable [QGVAR(plugStatus), [objNull, objNull, objNull, objNull], true];
_joystick setVariable [QGVAR(vehicleAmmo), 0, true];
_joystick setVehicleAmmo 0;

