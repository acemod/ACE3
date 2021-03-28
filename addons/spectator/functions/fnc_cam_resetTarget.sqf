#include "script_component.hpp"
/*
 * Author: Nelson Duarte, SilentSpike
 * Removes the current camera interest and detaches dummy target.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_cam_resetTarget
 *
 * Public: No
 */

private _camera = GVAR(camera);
private _dummy = GVAR(camDummy);

if !(isNull _camera || isNull _dummy) then {
    _camera camPrepareTarget objNull;
    _camera camCommitPrepared 0;

    detach _dummy;

    GVAR(camHasTarget) = false;
};
