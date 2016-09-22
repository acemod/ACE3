/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * none
 *
 * Return Value:
 * None
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
