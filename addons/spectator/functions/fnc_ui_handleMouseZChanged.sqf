#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO
 * Function used to handle mouse scroll event
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Change in Z <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleMouseZChanged
 *
 * Public: No
 */

if (GVAR(camMode) == MODE_FOLLOW) then {
    if ((_this select 1) > 0) then {
        GVAR(camDistance) = (GVAR(camDistance) - 1) max 0;
    } else {
        GVAR(camDistance) = (GVAR(camDistance) + 1) min GVAR(maxFollowDistance);
    };
};
