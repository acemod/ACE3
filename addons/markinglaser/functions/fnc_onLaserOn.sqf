#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles a plane turning its marking laser off.
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

// Start PFHs if this is the first laser
if (local _aircraft && {GVAR(localLasers) isEqualTo []}) then {
    [FUNC(updatePFH), 1, []] call CBA_fnc_addPerFrameHandler;

    // Make sure update is called before first render
    [] call FUNC(updatePFH);

    // Mark aircraft for JIPs
    _aircraft setVariable [QGVAR(laserOn), true, true];
};
if (hasInterface && {GVAR(lasers) isEqualTo []}) then {
    [FUNC(renderPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};

// Create laser
private _laser = "ACE_MarkingLaser" createVehicleLocal [0, 0, 0];
private _laserOrigin = _aircraft getVariable [QGVAR(laserOrigin), [0, 0, 0]];
_laser attachTo [_aircraft, _laserOrigin];
_aircraft setVariable [QGVAR(laser), _laser];
_laser setFeatureType 2;

// Render PFH will take care of visibility and orientation
_laser hideObject true;

GVAR(lasers) pushBack _laser;
if (local _aircraft) then {
    GVAR(localLasers) pushBack _laser;
};

if (isServer) then {
    private _killedEH = _aircraft addMPEventHandler ["MPKilled", {
        params ["_aircraft"];
        [QGVAR(laserOff), [_vehicle]] call CBA_fnc_globalEvent;
    }];
    _aircraft setVariable [QGVAR(killedEH), _killedEH];
};
