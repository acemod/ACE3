#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Handle key presses
 *
 * Arguments:
 * 0: Key Pressed <NUMBER>
 * 1: Down <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, true] call ace_spike_keyDown;
 *
 * Public: No
 */
params ["_key", "_down"];

if ((currentWeapon ACE_PLAYER) != QGVAR(launcher)) exitWith {};

if (_key == SPIKE_KEY_DESIGNATE) then {
    if (cameraView == "GUNNER") then {
        playSound "ACE_Sound_Click";
    };
    private _designateInput = 0;
    if (_down) then {
        _designateInput = 1;
    } else {
        _designateInput = 0;
    };
    (uiNamespace getVariable "ACE_RscOptics_spike") setVariable [QGVAR(designate), _designateInput];
};

_this call FUNC(camera_handleKeyPress);
