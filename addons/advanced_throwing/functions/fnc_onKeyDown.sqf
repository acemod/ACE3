#include "script_component.hpp"
/*
 * Author: Dslyecxi, Jonpas
 * Key down event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Key <NUMBER>
 * 2: Shift <BOOL>
 * 3: Ctrl <BOOL>
 * 4: Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [control, 5, false, true, false] call ace_advanced_throwing_fnc_onKeyDown
 *
 * Public: No
 */

if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {false};

params ["", "_key", "_shift", "_ctrl", "_alt"];

// Exit if any of the action keys is pressed
{
    if (_key in _x) exitWith {
        [ACE_player, "Pressed a key that cycles us out of throwables"] call FUNC(exitThrowMode);
    };
} forEach [
    actionKeys "ReloadMagazine",
    actionKeys "Handgun",
    actionKeys "Binoculars",
    actionKeys "SwitchWeapon",
    actionKeys "Optics",
    actionKeys "NextWeapon",
    actionKeys "PrevWeapon",
    actionKeys "OpticsTemp",
    actionKeys "SwitchPrimary",
    actionKeys "SwitchHandgun",
    actionKeys "SwitchSecondary"
];

false
