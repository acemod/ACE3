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
 * [control, 5, false, true, false] call ace_advancedthrowing_fnc_onKeyDown
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(inHand)) exitWith {false};

params ["", "_key", "_shift", "_ctrl", "_alt"];

// Extend arm drop mode (only on foot) - check _key to prevent some key weirdness and allow nice changing while moving
if (_ctrl && _key == 29) then {
    GVAR(extendedDrop) = [true, false] select GVAR(extendedDrop);
    GVAR(throwType) = "normal";

    // Change controls hint for MMB
    call FUNC(updateControlsHint);
};

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
