#include "script_component.hpp"
/*
 * Author: Glowbal
 * Sets the volume of the game, including third party radio modifications such as TFAR and ACRE.
 *
 * Arguments:
 * 0: setVolume (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_common_fnc_setVolume
 *
 * Public: Yes
 *
 * Note: Uses player
 */

#define MUTED_LEVEL  0.2
#define NORMAL_LEVEL 1
#define NO_SOUND     0

params [
    ["_setVolume", false],
    ["_unit", player]
];

if (_setVolume) then {
    // Vanilla Game
    2 fadeSound NORMAL_LEVEL;

    // TFAR
    _unit setVariable ["tf_voiceVolume", NORMAL_LEVEL, true];
    _unit setVariable ["tf_globalVolume", NORMAL_LEVEL];

    // ACRE2
    if (!isNil "acre_api_fnc_setGlobalVolume") then { [NORMAL_LEVEL^0.33] call acre_api_fnc_setGlobalVolume; };

} else {
    // Vanilla Game
    2 fadeSound MUTED_LEVEL;

    // TFAR
    _unit setVariable ["tf_voiceVolume", NO_SOUND, true];
    _unit setVariable ["tf_globalVolume", MUTED_LEVEL];

    // ACRE2
    if (!isNil "acre_api_fnc_setGlobalVolume") then { [MUTED_LEVEL^0.33] call acre_api_fnc_setGlobalVolume; };
};
