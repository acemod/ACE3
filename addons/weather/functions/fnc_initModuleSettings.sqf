/*
 * Author: Glowbal, Ruthberg
 * Module for adjusting the wind deflection settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [module, [], true] call ace_weather_fnc_initModuleSettings
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

// Overrides the default weather (editor, mission settings) with ACE weather (map based)
[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);

// Server weather update interval
[_logic, QGVAR(updateInterval), "updateInterval"] call EFUNC(common,readSettingFromModule);

GVAR(updateInterval) = 1 max GVAR(updateInterval) min 600;
