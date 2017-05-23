/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to handle key release
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

params ["","_key","_shift","_ctrl","_alt"];

if (_key == DIK_LALT) exitWith {
    [false] call FUNC(cam_toggleVeryFast);
    true
};

false
