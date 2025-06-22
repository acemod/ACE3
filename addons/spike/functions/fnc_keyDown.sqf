#include "..\script_component.hpp"
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
 * [5, true] call ace_spike_fnc_keyDown
 *
 * Public: No
 */
if ((currentWeapon ACE_player) != QGVAR(launcher)) exitWith {};

params ["_key", "_down"];

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

call FUNC(camera_handleKeyPress);
