#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: Nelson Duarte, SilentSpike
 * Function used to handle key up event
 *
 * Arguments:
 * 0: Spectator display <DISPLAY>
 * 1: Key DIK code <NUMBER>
 * 2: State of shift <BOOL>
 * 3: State of ctrl <BOOL>
 * 4: State of alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleKeyUp
 *
 * Public: No
 */

params ["","_key","_shift","_ctrl","_alt"];

if (_key == DIK_LALT) exitWith {
    [false] call FUNC(cam_toggleSlow);
    true
};

false
