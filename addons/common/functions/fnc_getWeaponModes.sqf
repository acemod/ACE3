/*
 * Author: commy2
 *
 * Get the available firing modes of a weapon. Will ignore the ai helper modes.
 *
 * Arguments:
 * 0: A weapon in cfgWeapons (String)
 *
 * Return Value:
 * All firing modes (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_modes"];

params ["_weapon"];

_modes = [];
{
    if (getNumber (configFile >> "CfgWeapons" >> _weapon >> _x >> "showToPlayer") == 1) then {
        _modes pushBack _x;
    };

    if (_x == "this") then {
        _modes pushBack _weapon;
    };
    true
} count getArray (configfile >> "CfgWeapons" >> _weapon >> "modes");

_modes
