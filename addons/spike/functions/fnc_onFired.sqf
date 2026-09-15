#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initialises SPIKE camera
 *
 * Arguments:
 * 0: Fired EH <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [firedEH] call ace_spike_fnc_onFired
 *
 * Public: No
 */

params ["_firedEH"];
_firedEH params ["_shooter","_weapon","","_mode","_ammo","","_projectile"];

private _missileGuidanceConfig = (configOf _projectile) >> "ace_missileguidance";
// Setup camera array
private _cameraConfig = _missileGuidanceConfig >> "camera";
private _cameraArray = [false];
if (!isNull _cameraConfig && { (getNumber (_cameraConfig >> "enabled")) == 1 }) then {
    _cameraArray set [0, true];
    _cameraArray set [1, getArray (_cameraConfig >> "fovLevels")];
    _cameraArray set [2, getNumber (_cameraConfig >> "initialFOV")];

    _cameraArray set [3, getArray (_cameraConfig >> "enabledThermalTypes")];
    _cameraArray set [4, getText (_cameraConfig >> "initialThermalType")];

    _cameraArray set [5, (getNumber (_cameraConfig >> "switchOnFire")) == 1];

    _cameraArray set [6, getNumber (_cameraConfig >> "lerpFOV")];
    _cameraArray set [7, getNumber (_cameraConfig >> "fovChangeTime")];

    _cameraArray set [8, [[0, 0, 0], [0, 0, 0], [0, 0, 0], false, false]]; // camera view data. [look direction, ground pos, point pos, moving camera x, moving camera y]

    private _cameraConfigGimbal = _cameraConfig >> "gimbal";
    _cameraArray set [9, [
        getNumber (_cameraConfigGimbal >> "enabled") == 1,
        getNumber (_cameraConfigGimbal >> "gimbalAngleX"),
        getNumber (_cameraConfigGimbal >> "gimbalAngleY"),
        getNumber (_cameraConfigGimbal >> "gimbalSpeedX"),
        getNumber (_cameraConfigGimbal >> "gimbalSpeedY"),
        getNumber (_cameraConfigGimbal >> "gimbalInitOffsetX"),
        getNumber (_cameraConfigGimbal >> "gimbalInitOffsetY"),
        getArray (_cameraConfigGimbal >> "fovGimbalSpeedModifiers"),
        getNumber (_cameraConfigGimbal >> "stabilizeWhenMoving") == 1,
        getNumber (_cameraConfigGimbal >> "designateWhenStationary") == 1,
        getNumber (_cameraConfigGimbal >> "trackLockedPosition") == 1
    ]];

    private _cameraConfigReticle = _cameraConfig >> "reticle";
    _cameraArray set [10, [
        getText (_cameraConfigReticle >> "titleRsc"),
        getNumber (_cameraConfigReticle >> "centerReticle"),
        getArray (_cameraConfigReticle >> "controlsToDisappearOnLock"),
        getArray (_cameraConfigReticle >> "controlsToAppearOnLock"),
        getNumber (_cameraConfigReticle >> "leftGate"),
        getNumber (_cameraConfigReticle >> "rightGate"),
        getNumber (_cameraConfigReticle >> "topGate"),
        getNumber (_cameraConfigReticle >> "bottomGate"),
        getText (_cameraConfigReticle >> "uiNamespaceDialogVariable"),
        getNumber (_cameraConfigReticle >> "reticleMovesWithTrack") == 1
    ]];

    _cameraArray set [11, (getNumber (_cameraConfig >> "alwaysDesignate")) == 1];
    _cameraArray set [12, (getNumber (_cameraConfig >> "canStopDesignating")) == 1];
};

private _preTarget = +(ACE_player getVariable [QGVAR(target), [0, 0, 0]]);
ACE_player setVariable [QGVAR(target), [0, 0, 0]];
private _camera = [_projectile, _cameraArray, _shooter, _preTarget isEqualTo [0, 0, 0]] call FUNC(camera_init);
GVAR(projectileHashMap) set [hashValue _projectile, [_camera, _preTarget]];
[{
    params ["_args", "_pfID"];
    _args params ["_firedEH", "_cameraArray", "_lastUpdate", "_camera", "_projectileHash"];

    _firedEH params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];

    if (!alive _projectile || isNull _projectile || isNull _shooter) exitWith {
        GVAR(projectileHashMap) deleteAt _projectileHash;
        [_camera] call FUNC(camera_destroy);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    [_cameraArray, _projectile, CBA_missionTime - _lastUpdate, _camera] call FUNC(camera_update);

    _args set [2, CBA_missionTime];
}, 0, [_firedEH, _cameraArray, CBA_missionTime, _camera, hashValue _projectile]] call CBA_fnc_addPerFrameHandler;
