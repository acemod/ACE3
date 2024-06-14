#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles a plane turning its marking laser on.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [plane] call ace_markinglaser_fnc_onLaserOff
 *
 * Public: No
 */

params ["_aircraft"];

GVAR(lasers) deleteAt (GVAR(lasers) find _aircraft);
GVAR(localLasers) deleteAt (GVAR(localLasers) find _laser);

if (local _aircraft) then {
    _aircraft setVariable [QGVAR(laserOn), false, true];
};

if (isServer) then {
    _aircraft removeMPEventHandler ["MPKilled", _aircraft getVariable QGVAR(killedEH)];
};
