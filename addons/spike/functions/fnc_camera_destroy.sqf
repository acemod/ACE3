#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Destroys camera attaches to projectile
 *
 * Arguments:
 * 0: Camera <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_destroy
 *
 * Public: No
 */
params ["_cameraNamespace"];

private _userInThisCamera = [_cameraNamespace] call FUNC(camera_userInCamera);
private _userCamera = ACE_player getVariable [QGVAR(missileCamera), objNull];

if (_userInThisCamera || { _userCamera isEqualTo _cameraNamespace }) then {
    ACE_player setVariable [QGVAR(missileCamera), objNull];
};

[_cameraNamespace] call FUNC(camera_switchAway);

private _key = _cameraNamespace getVariable [QGVAR(missile), objNull];

private _logic = _cameraNamespace getVariable [QGVAR(logic), objNull];
deleteVehicle _logic;

private _camera = _cameraNamespace getVariable QGVAR(camera);
camDestroy _camera;

_cameraNamespace call CBA_fnc_deleteNamespace;
