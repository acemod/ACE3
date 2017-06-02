/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to toggle camera slow speed mode
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(camMode) != MODE_FREE) exitWith {
    _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
    GVAR(camSlow) = false;
};

private _camera = GVAR(camera);
GVAR(camSlow) = !GVAR(camSlow);

if (GVAR(camSlow)) then {
    _camera camCommand format ["speedDefault %1", SPEED_SLOW];
} else {
    _camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
};
