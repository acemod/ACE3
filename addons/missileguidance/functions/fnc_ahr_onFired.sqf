#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up Active Radar state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_ahr_onFired
 *
 * Public: No
 */
params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];
_launchParams params ["","_targetLaunchParams"];
_targetLaunchParams params ["_target"];

_target = missileTarget _projectile;
if (isNull _target && isVehicleRadarOn vehicle _shooter) then {
    _target = cursorTarget;
};
if !(_target isKindOf "AllVehicles") then {
    _target = nil;
};
_launchParams set [0, _target];
_projectile setMissileTarget objNull; // to emulate a no launch warning

private _projectileConfig = [_projectile] call CBA_fnc_getObjectConfig;
private _config = _projectileConfig >> "ace_missileguidance";

private _isActive = false;
private _activeRadarDistance = [_config >> "activeRadarEngageDistance", "NUMBER", 500] call CBA_fnc_getConfigEntry;
private _projectileThrust = [_projectileConfig >> "thrust", "NUMBER", 0] call CBA_fnc_getConfigEntry;
private _projectileThrustTime = [_projectileConfig >> "thrustTime", "NUMBER", 0] call CBA_fnc_getConfigEntry;

private _velocityAtImpact = _projectileThrust * _projectileThrustTime;
private _timeToActive = 0;
if (!isNil "_target" && _velocityAtImpact > 0) then {
    private _distanceUntilActive = (((getPosASL _shooter) vectorDistance (getPosASL _target)) - _activeRadarDistance);
    _timeToActive = 0 max (_distanceUntilActive / _velocityAtImpact);
};

if (isNil "_target") then {
    _timeToActive = 0;
    _isActive = true;
    _target = objNull;
};

private _shooterHasActiveRadar = {
    if ("ActiveRadarSensorComponent" in _x) exitWith { true };
    false
} forEach listVehicleSensors vehicle _shooter;

if !(isVehicleRadarOn vehicle _shooter) then {
    _isActive = true;
};

_seekerStateParams set [0, _isActive];
_seekerStateParams set [1, _activeRadarDistance];
_seekerStateParams set [2, CBA_missionTime + _timeToActive];
_seekerStateParams set [3, getPosASL _target];
_seekerStateParams set [4, CBA_missionTime];
_seekerStateParams set [5, _shooterHasActiveRadar];
_seekerStateParams set [6, false];
_seekerStateParams set [7, [0, 0, 0]];
_seekerStateParams set [8, CBA_missionTime];
_seekerStateParams set [9, isNull _target];

