/*
 * Author: Nelson Duarte, AACO
 * Function used to handle mouse moving event
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(holdingRMB) && { GVAR(camMode) == MODE_FOLLOW  }) then {
    params ["", "_deltaX", "_deltaY"];

    if (_deltaX != 0) then {
        GVAR(camYaw) = ((GVAR(camYaw) + (_deltaX * 100 * GVAR(camDeltaTime)) + 180.0) % 360.0) - 180;
    };

    if (_deltaY != 0) then {
        GVAR(camPitch) = (((GVAR(camYaw) - (_deltaY * 100 * GVAR(camDeltaTime))) max -90.0) min 90.0);
    };
};
