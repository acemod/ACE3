/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to set camera slow speed mode
 *
 * Arguments:
 * 0: Enable slow speed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_spectator_fnc_cam_toggleSlow
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_slowSpeed"];

if !(GVAR(camSlow) isEqualTo _slowSpeed) then {
    private _camera = GVAR(camera);

    if (GVAR(camMode) == MODE_FREE) then {
        GVAR(camSlow) = _slowSpeed;

        if (_slowSpeed) then {
            _camera camCommand format ["speedDefault %1", SPEED_SLOW];
        } else {
           _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
        };
    } else {
        _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
        GVAR(camSlow) = false;
    };
};
