/*
 * Author: BaerMitUmlaut
 * Makes the IR weapon lights visible depending on wether the player wears NVGs or not.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_irlight_fnc_updateWeaponLights
 *
 * Public: No
 */
#include "script_component.hpp"

private _hasIRLight = "ACE_acc_pointer_IR_flashlight" in primaryWeaponItems ACE_player;
private _isLightOn  = ACE_player isFlashlightOn primaryWeapon ACE_player;
private _synchedOn  = ACE_player getVariable [QGVAR(turnedOn), false];
private _inNVGS = IN_NVGS;

// Detect if player switched light on or off
if (_hasIRLight) then {
    if (_inNVGS) then {
        // Synch weapon light state with virtual state
        if !(_isLightOn isEqualTo _synchedOn) then {
            [QGVAR(switchedLight), [ACE_player, _isLightOn]] call CBA_fnc_globalEvent;
            ACE_player setVariable [QGVAR(turnedOn), _isLightOn, true];
        };
    } else {
        // No NVGs, but light is on
        // -> player pressed the weapon light button
        // -> switch light status
        if (_isLightOn) then {
            [QGVAR(switchedLight), [ACE_player, !_synchedOn]] call CBA_fnc_globalEvent;
            ACE_player setVariable [QGVAR(turnedOn), !_synchedOn, true];
        };
    };
};

// Override weapon light of all units with enabled IR light
if  (_inNVGS) then {
    {
        _x action ["GunLightOn", _x];
    } forEach GVAR(units);
} else {
    {
        _x action ["GunLightOff", _x];
    } forEach GVAR(units);
};
