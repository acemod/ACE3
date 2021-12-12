#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Destroys camera attaches to projectile
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_cameraNamespace"];

private _userInThisCamera = [_cameraNamespace] call FUNC(camera_userInCamera);
private _userCamera = ACE_PLAYER getVariable [QGVAR(missileCamera), objNull];
if (_userInThisCamera || { _userCamera isEqualTo _cameraNamespace }) then {
    ACE_PLAYER setVariable [QGVAR(missileCamera), objNull];
};

[_cameraNamespace] call FUNC(camera_switchAway);

private _key = _cameraNamespace getVariable [QGVAR(missile), objNull];

private _logic = _cameraNamespace getVariable [QGVAR(logic), objNull];
deleteVehicle _logic;

private _camera = _cameraNamespace getVariable QGVAR(camera);
camDestroy _camera;

_cameraNamespace call CBA_fnc_deleteNamespace;

