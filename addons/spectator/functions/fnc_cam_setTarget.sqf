/*
 * Author: Nelson Duarte, SilentSpike
 * Sets the current camera interest using dummy target.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_spectator_fnc_cam_setTarget
 *
 * Public: No
 */

#include "script_component.hpp"
#define CAMERA_TARGET_CHANGE_TIME 0.5

params ["_object"];

private _camera = GVAR(camera);
private _dummy = GVAR(camDummy);
private _location = _object worldToModel (_object modelToWorldVisual (_object selectionPosition "Head"));

if (!isNull _camera && !isNull _dummy) then {
    _dummy attachTo [vehicle _object, _location];
    _camera camPrepareTarget _dummy;
    _camera camCommitPrepared CAMERA_TARGET_CHANGE_TIME;

    GVAR(camhasTarget) = true;
};
