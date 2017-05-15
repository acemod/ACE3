/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to toggle camera very fast speed mode
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_fastSpeed"];

if !(GVAR(camFast) isEqualTo _fastSpeed) then {
    private _camera = GVAR(camera);

    if (GVAR(camMode) == MODE_FREE) then {
        GVAR(camFast) = _fastSpeed;

        if (_fastSpeed) then {
            _camera camCommand format ["speedDefault %1", SPEED_VERYFAST];
        } else {
            _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
        };
    } else {
        _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
        GVAR(camFast) = false;
    };
};
