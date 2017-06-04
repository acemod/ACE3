/*
 * Author: Nelson Duarte, AACO
 * Function used to handle mouse moving event
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Change in x <NUMBER>
 * 2: Change in y <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleMouseMoving
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(holdingRMB) && { GVAR(camMode) == MODE_FOLLOW  }) then {
    params ["", "_deltaX", "_deltaY"];

    if (_deltaX != 0) then {
        GVAR(camYaw) = ((GVAR(camYaw) + (_deltaX * 100 * GVAR(camDeltaTime)) + 180) % 360) - 180;
    };

    if (_deltaY != 0) then {
        GVAR(camPitch) = (((GVAR(camPitch) - (_deltaY * 100 * GVAR(camDeltaTime))) max -90) min 90);
    };
};
