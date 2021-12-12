#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initializes camera for player to view missile from its nose
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * The camera <OBJECT>
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_projectile", "_cameraArray", "_shooter", "_preTrack"];
_cameraArray params ["_enabled", "_fovLevels", "_initialFOV", "_thermalTypes", "_initialThermalType", "_switchOnFire", "_lerpFOV", "_fovChangeTime", "", "_gimbalData", "_reticleData", "_designating"];
_gimbalData params ["_hasGimbal", "_maxGimbalX", "_maxGimbalY", "_gimbalSpeedX", "_gimbalSpeedY", "_initGimbalAngleX", "_initGimbalAngleY", "_gimbalZoomSpeedModifiers"];
 
if !(_enabled) exitWith {};
 
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

if (_preTrack) then {
    private _pos = _projectile;

    private _lookDirection = if !(_shooter isKindOf "CAManBase" || {_shooter isKindOf "StaticWeapon"}) then {
        private _finalLookDirection = if (_shooter isKindOf "Plane") then {
            _pos = _shooter modelToWorldVisual getPilotCameraPosition _shooter;
            private _trackingTarget = getPilotCameraTarget _shooter;
            _trackingTarget params ["_isTracking", "_trackingPos"];
            // Because ARMA doesnt update the camera rotation if you are locked on immediatly, we have to calculate the look direction manually or else the SACLOS target will be wrong, especially if shooter is moving
            if (_isTracking) then {
                vectorNormalized (_trackingPos vectorDiff _pos);
            } else {
                _shooter vectorModelToWorldVisual getPilotCameraDirection _shooter;
            };
        } else {
            private _gBody = -deg(_shooter animationPhase _animationSourceBody);
            private _gGun = deg(_shooter animationPhase _animationSourceGun);
            _shooter vectorModelToWorldVisual ([1, _gBody, _gGun] call CBA_fnc_polar2vect);
        };
        _finalLookDirection
    } else {
        _pos = ASLtoAGL eyePos _shooter;
        _shooter weaponDirection currentWeapon _shooter
    };

    private _camera = "camera" camCreate _pos;
    private _logic = "Logic" createVehicleLocal _pos;

    _activeCameraNamespace setVariable [QGVAR(projectileSize), 0];

    private _logicPosition = (AGLtoASL _pos) vectorAdd (_lookDirection vectorMultiply GIMBAL_LOGIC_OFFSET);
    _logic setPosASL _logicPosition;
    _logic setVectorDir _lookDirection;

    _camera camSetTarget _logic;
    _camera setPos _pos;
    _camera camSetFOV _initialFOV;

    _camera camCommit 0;
    showCinemaBorder false;
    camUseNVG false;

    _activeCameraNamespace setVariable [QGVAR(camera), _camera];
    _activeCameraNamespace setVariable [QGVAR(logic), _logic];
    _activeCameraNamespace setVariable [QGVAR(missile), objNull];
    _activeCameraNamespace setVariable [QGVAR(logicPos), _shooter worldToModelVisual _logicPosition];
} else {
    private _pos = getPosASL _projectile;

    private _camera = "camera" camCreate _pos;
    private _logic = "Logic" createVehicleLocal _pos;

    private _initPosX = (tan _initGimbalAngleX) * GIMBAL_LOGIC_OFFSET;
    private _initPosY = (tan _initGimbalAngleY) * GIMBAL_LOGIC_OFFSET;

    private _projectileBounds = (1 boundingBoxReal _projectile);
    private _projectileSize = (_projectileBounds#1) vectorDiff (_projectileBounds#0);
    _activeCameraNamespace setVariable [QGVAR(projectileSize), _projectileSize#1];

    private _logicPosition = [_initPosX, GIMBAL_LOGIC_OFFSET, _initPosY] vectorAdd [0, _projectileSize#1, 0];

    _logic setPosASL (_projectile modelToWorldVisualWorld _logicPosition);

    _camera camSetTarget _logic;
    _camera setPos (_projectile modelToWorldVisual ((_projectile worldToModelVisual (ASLtoATL getPosASL _projectile)) vectorAdd [0, _projectileSize#1, 0]));
    _camera camSetFOV _initialFOV;

    _camera camCommit 0;
    showCinemaBorder false;
    camUseNVG false;

    _activeCameraNamespace setVariable [QGVAR(lastMissileOrientation), vectorNormalized velocity _projectile];
    _activeCameraNamespace setVariable [QGVAR(camera), _camera];
    _activeCameraNamespace setVariable [QGVAR(logic), _logic];
    _activeCameraNamespace setVariable [QGVAR(missile), _projectile];
    _activeCameraNamespace setVariable [QGVAR(logicPos), _projectile vectorModelToWorldVisual _logicPosition];

    if (_switchOnFire) then {
        [_activeCameraNamespace] call FUNC(camera_switchTo);
    };
};

_activeCameraNamespace

