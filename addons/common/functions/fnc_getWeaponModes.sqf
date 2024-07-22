#include "..\script_component.hpp"
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
 * Example:
 * ["gun"] call ace_common_fnc_getWeaponModes
 *
 * Public: Yes
 */

params [["_weapon", "", [""]]];

private _config = configFile >> "CfgWeapons" >> _weapon;

private _modes = [];

{
    if (getNumber (_config >> _x >> "showToPlayer") == 1) then {
        _modes pushBack _x;
    };

    if (_x == "this") then {
        _modes pushBack _weapon;
    };
} forEach getArray (_config >> "modes");

_modes
