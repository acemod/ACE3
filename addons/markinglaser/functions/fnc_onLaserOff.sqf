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
 * [plane] call ace_markinglaser_fnc_onLaserOn
 *
 * Public: No
 */
params ["_aircraft"];

private _laser = _aircraft getVariable [QGVAR(laser), objNull];

GVAR(lasers) deleteAt (GVAR(lasers) find _laser);
GVAR(localLasers) deleteAt (GVAR(localLasers) find _laser);

deleteVehicle _laser;

if (local _aircraft) then {
    _aircraft setVariable [QGVAR(laserOn), false, true];
};

if (isServer) then {
    _aircraft removeMPEventHandler ["MPKilled", _aircraft getVariable QGVAR(killedEH)];
};
