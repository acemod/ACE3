#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initializes camera for player to view missile from its nose
 *
 * Arguments:
 * 0: Missile <OBJECT>
 * 1: Cam Array <ARRAY>
 * 2: Shooter <OBJECT>
 * 3: Switch On Fire <BOOL>
 *
 * Return Value:
 * The camera <OBJECT>
 *
 * Example:
 * [m, [], player, false] call ace_spike_fnc_camera_init
 *
 * Public: No
 */
params ["_projectile", "_cameraArray", "_shooter", "_switchOnFireInit"];
_cameraArray params ["_enabled", "_fovLevels", "_initialFOV", "_thermalTypes", "_initialThermalType", "_switchOnFire", "_lerpFOV", "_fovChangeTime", "", "_gimbalData", "_reticleData", "_designating"];
_gimbalData params ["_hasGimbal", "_maxGimbalX", "_maxGimbalY", "_gimbalSpeedX", "_gimbalSpeedY", "_initGimbalAngleX", "_initGimbalAngleY", "_gimbalZoomSpeedModifiers"];

if !(_enabled) exitWith { objNull };

private _activeCameraNamespace = [] call CBA_fnc_createNamespace;
_activeCameraNamespace setVariable [QGVAR(fovLevels), _fovLevels];
_activeCameraNamespace setVariable [QGVAR(thermalTypes), _thermalTypes];

_activeCameraNamespace setVariable [QGVAR(lerpFOVChange), _lerpFOV == 1];
_activeCameraNamespace setVariable [QGVAR(targetFOV), _initialFOV];
_activeCameraNamespace setVariable [QGVAR(currentFOV), _initialFOV];
_activeCameraNamespace setVariable [QGVAR(fovChanged), false];
_activeCameraNamespace setVariable [QGVAR(fovChangeTime), _fovChangeTime];
_activeCameraNamespace setVariable [QGVAR(lastMovedGroundPos), [0, 0, 0]];
private _currentZoomIndex = _fovLevels findIf { _x isEqualTo _initialFOV };
if (_currentZoomIndex < 0) then { _currentZoomIndex = 0 };

private _currentTIIndex = _thermalTypes findIf { _x isEqualTo _initialThermalType };
if (_currentTIIndex < 0) then { _currentTIIndex = 0 };

_activeCameraNamespace setVariable [QGVAR(currentZoomIndex), _currentZoomIndex];
_activeCameraNamespace setVariable [QGVAR(currentTIModeIndex), _currentTIIndex];

if (_designating) then {
    _activeCameraNamespace setVariable [QGVAR(alwaysDesignate), true];
};
_activeCameraNamespace setVariable [QGVAR(reticleData), _reticleData];
_shooter setVariable [QGVAR(missileCamera), _activeCameraNamespace];
_activeCameraNamespace setVariable [QGVAR(shooter), _shooter];
[_activeCameraNamespace, _initialThermalType] call FUNC(camera_setViewMode);

private _pos = getPosASL _projectile;

private _camera = "camera" camCreate _pos;
private _logic = "Logic" createVehicleLocal _pos;

private _initPosX = (tan _initGimbalAngleX) * GIMBAL_LOGIC_OFFSET;
private _initPosY = (tan _initGimbalAngleY) * GIMBAL_LOGIC_OFFSET;

private _projectileBounds = 1 boundingBoxReal _projectile;
private _projectileSize = (_projectileBounds#1) vectorDiff (_projectileBounds#0);
_activeCameraNamespace setVariable [QGVAR(projectileSize), _projectileSize#1];

private _logicPosition = [_initPosX, GIMBAL_LOGIC_OFFSET, _initPosY] vectorAdd [0, _projectileSize#1, 0];

_logic setPosASL (_projectile modelToWorldVisualWorld _logicPosition);

_camera camSetTarget _logic;
_camera setPos (_projectile modelToWorldVisual ((_projectile worldToModelVisual (ASLToATL getPosASL _projectile)) vectorAdd [0, _projectileSize#1, 0]));
_camera camSetFov _initialFOV;

_camera camCommit 0;
showCinemaBorder false;
camUseNVG false;

_activeCameraNamespace setVariable [QGVAR(lastMissileOrientation), vectorNormalized velocity _projectile];
_activeCameraNamespace setVariable [QGVAR(camera), _camera];
_activeCameraNamespace setVariable [QGVAR(logic), _logic];
_activeCameraNamespace setVariable [QGVAR(missile), _projectile];
_activeCameraNamespace setVariable [QGVAR(logicPos), _projectile vectorModelToWorldVisual _logicPosition];

if (_switchOnFire && _switchOnFireInit) then {
    [_activeCameraNamespace] call FUNC(camera_switchTo);
};

_activeCameraNamespace
