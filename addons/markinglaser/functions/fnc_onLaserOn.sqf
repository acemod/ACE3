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
if (local _aircraft && {GVAR(updatePFH) == -1}) then {
    GVAR(updatePFH) = [FUNC(updatePFH), 1, []] call CBA_fnc_addPerFrameHandler;

    // Make sure update is called before first render
    [] call FUNC(updatePFH);
};

if (hasInterface && {GVAR(renderPFH) == -1}) then {
    GVAR(renderPFH) = [FUNC(renderPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};

// Create laser
private _laser = "ACE_MarkingLaser" createVehicleLocal [0, 0, 0];
private _laserOrigin = _aircraft getVariable [QGVAR(laserOrigin), ""];
_laser setPosASL (_aircraft modelToWorldVisualWorld (_aircraft selectionPosition _laserOrigin));
_laser setVariable [QGVAR(aircraft), _aircraft];
_aircraft setVariable [QGVAR(laser), _laser];

// Render PFH will take care of visibility and orientation
_laser hideObject true;

GVAR(lasers) pushBack _laser;
if (local _aircraft) then {
    GVAR(localLasers) pushBack _laser;

    // Mark aircraft for JIPs
    _aircraft setVariable [QGVAR(laserOn), true, true];
};

if (isServer) then {
    private _killedEH = _aircraft addMPEventHandler ["MPKilled", {
        params ["_aircraft"];
        [QGVAR(laserOff), [_aircraft]] call CBA_fnc_globalEvent;
    }];
    _aircraft setVariable [QGVAR(killedEH), _killedEH];
};
