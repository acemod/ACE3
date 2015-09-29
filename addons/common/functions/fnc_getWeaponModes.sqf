/*
 * Author: commy2
 * Get the available firing modes of a weapon. Will ignore the AI helper modes.
 *
 * Arguments:
 * 0: Weapon <STRING>
 *
 * Return Value:
 * Firing Modes <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_weapon"];

private ["_config", "_modes"];

_config = configFile >> "CfgWeapons" >> _weapon;

_modes = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") == 1) then {
        _modes pushBack _x;
    };

    if (_x == "this") then {
        _modes pushBack _weapon;
    };
    false
} count getArray (_config >> "modes");

_modes
