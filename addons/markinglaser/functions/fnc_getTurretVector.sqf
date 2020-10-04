#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Calculates the directional vector of a turret mounted marking laser.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * Directional vector of laser in world space <ARRAY>
 *
 * Example:
 * [plane] call ace_markinglaser_fnc_getTurretVector
 *
 * Public: No
 */

params ["_aircraft"];

private _turretInfo = _aircraft getVariable [QGVAR(turretInfo), []];
_turretInfo params ["_turretPath", "_animationSources", "_followFreeLook"];

private _controlledTurret = if (unitIsUAV cameraOn) then {
    ACE_controlledUAV#2
} else {
    cameraOn unitTurret ACE_player
};

if ((cameraOn == _aircraft) && {(_followFreeLook && {cameraView == "INTERNAL"}) || {cameraView == "GUNNER"}} && {!freeLook} && {_turretPath isEqualTo _controlledTurret}) then {
    // Camera has some inertia which the turret does not have, use center of screen instead
    (AGLToASL positionCameraToWorld [0, 0, 0]) vectorFromTo (AGLToASL positionCameraToWorld [0, 0, 1])
} else {
    // Get turret dir through animation source
    private _angleBody = -deg(_aircraft animationPhase _animationSources#0);
    private _angleGun = deg(_aircraft animationPhase _animationSources#1);

    _aircraft vectorModelToWorld ([1, _angleBody, _angleGun] call CBA_fnc_polar2vect)
};
