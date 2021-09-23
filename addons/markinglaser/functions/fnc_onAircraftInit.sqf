#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips an aircraft with a marking laser.
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

// Assume enabled by default
if !(_aircraft getVariable [QGVAR(enabled), true]) exitWith {};

private _config = configOf _aircraft;
private _turretData = [_config] call FUNC(findTurret);
private _hasPilotCamera = getNumber (_config >> "PilotCamera" >> "controllable") > 0;

if ((_turretData isEqualTo []) && {!_hasPilotCamera}) exitWith {
    _aircraft setVariable [QGVAR(enabled), false];
    WARNING_1("Class %1 does not have a pilot camera nor a turret that could be equipped with an IR marking laser.",configName _config);
};

_aircraft setVariable [QGVAR(enabled), true];

if (_turretData isEqualTo []) then {
    // Use pilot camera if no turrets are available
    private _origin = getText (_config >> "memoryPointDriverOptics");

    // Elevation limits are inverted, possibly because TGPs are usually mounted below the wing
    private _limits = [
        getNumber (_config >> "PilotCamera" >> "minTurn"),
        getNumber (_config >> "PilotCamera" >> "maxTurn"),
        -getNumber (_config >> "PilotCamera" >> "maxElev"),
        -getNumber (_config >> "PilotCamera" >> "minElev")
    ];

    _aircraft setVariable [QGVAR(useTurret), false];
    _aircraft setVariable [QGVAR(laserOrigin), _origin];
    _aircraft setVariable [QGVAR(gimbalLimits), _limits];
} else {
    // Use turret of copilot or primary gunner
    _turretData params ["_turretPath", "_turretConfig"];

    private _origin = getText (_turretConfig >> "memoryPointGunnerOptics");
    private _limits = [
        getNumber (_turretConfig >> "minTurn"),
        getNumber (_turretConfig >> "maxTurn"),
        getNumber (_turretConfig >> "minElev"),
        getNumber (_turretConfig >> "maxElev")
    ];

    // Animation sources are used to detect direction of turret
    private _animationSources = [
        getText (_turretConfig >> "animationSourceBody"),
        getText (_turretConfig >> "animationSourceGun")
    ];

    // Some helicopter turrets follow the look direction when not in gunner view
    private _followFreeLook = (getNumber (_turretConfig >> "turretFollowFreeLook")) > 0;

    _aircraft setVariable [QGVAR(useTurret), true];
    _aircraft setVariable [QGVAR(laserOrigin), _origin];
    _aircraft setVariable [QGVAR(gimbalLimits), _limits];
    _aircraft setVariable [QGVAR(turretInfo), [_turretPath, _animationSources, _followFreeLook]];
};
