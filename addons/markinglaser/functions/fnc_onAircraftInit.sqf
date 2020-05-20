#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Prepares an aircraft for using a marking laser.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [plane] call ace_markinglaser_fnc_onAircraftInit
 *
 * Public: No
 */
params ["_aircraft"];

if (local _aircraft) then {
    _aircraft setVariable [QGVAR(laserOrigin), getPilotCameraPosition _aircraft, true];
};
