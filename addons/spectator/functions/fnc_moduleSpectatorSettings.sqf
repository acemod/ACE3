/*
 * Author: SilentSpike
 * Read spectator settings from module
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_spectator_fnc_moduleSpectatorSettings
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(enableAI), "enableAI"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(restrictModes), "cameraModes"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(restrictVisions), "visionModes"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mapLocations), "mapLocations"] call EFUNC(common,readSettingFromModule);
