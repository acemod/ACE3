/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_optionsmenu_fnc_moduleAllowConfigExport
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic"];

if (isMultiplayer) exitWith {};

if (_logic getVariable ["allowconfigurationExport", false]) then {
    GVAR(serverConfigGeneration) = 1;
} else {
    GVAR(serverConfigGeneration) = 0;
};
