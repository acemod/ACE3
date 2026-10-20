#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up doppler radar state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_doppler_onFired
 *
 * Public: No
 */
 
params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];
_launchParams params ["","_targetLaunchParams"];
_targetLaunchParams params ["_target"];

private _vehicle = vehicle _shooter;
if (isNull _target && isVehicleRadarOn _vehicle) then {
    _target = cursorTarget;
};
// always allow tracking of projectiles
if !(_target isKindOf "AllVehicles" || { (typeOf _target) isKindOf ["Default", configFile >> "CfgAmmo"] }) then {
    _target = objNull;
};
_launchParams set [0, _target];
_projectile setMissileTarget objNull; // to emulate a no launch warning

private _projectileConfig = configOf _projectile;
private _config = _projectileConfig >> "ace_missileguidance";

private _isActive = false;
private _activeRadarDistance = [_config >> "activeRadarEngageDistance", "NUMBER", 500] call CBA_fnc_getConfigEntry;
private _projectileThrust = getNumber (_projectileConfig >> "thrust");
private _projectileThrustTime = getNumber (_projectileConfig >> "thrustTime");

private _lockTypes = [_config >> "lockableTypes", "ARRAY", ["Air", "LandVehicle", "Ship"]] call CBA_fnc_getConfigEntry;

private _minimumFilterSpeed = [_config >> "minimumSpeedFilter", "NUMBER", 30] call CBA_fnc_getConfigEntry;
private _minimumFilterTime = [_config >> "minimumTimeFilter", "NUMBER", 1e-4] call CBA_fnc_getConfigEntry;
private _maxTerrainCheck = [_config >> "maxTerrainCheck", "NUMBER", 16000] call CBA_fnc_getConfigEntry;

private _velocityAtImpact = _projectileThrust * _projectileThrustTime;
private _timeToActive = 0;
if (!isNull _target && _velocityAtImpact > 0) then {
    private _distanceUntilActive = (((getPosASL _shooter) vectorDistance (getPosASL _target)) - _activeRadarDistance);
    _timeToActive = 0 max (_distanceUntilActive / _velocityAtImpact);
};

if (isNull _target) then {
    _timeToActive = 0;
    _isActive = true;
    _target = objNull;
};

private _shooterHasActiveRadar = (listVehicleSensors _vehicle) findIf {"ActiveRadarSensorComponent" in _x} != -1;

if !(isVehicleRadarOn _vehicle) then {
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
_seekerStateParams set [10, _lockTypes];
_seekerStateParams set [11, _minimumFilterSpeed];
_seekerStateParams set [12, _minimumFilterTime];
_seekerStateParams set [13, _maxTerrainCheck];

