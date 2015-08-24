/*
 * Author: Dslyecxi, MikeMatrix
 * Initializes Settings for the module and transcodes settings to a useable format.
 *
 * Arguments:
 * 0: Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [module, [player], true] call ace_map_gestures_fnc_moduleGroupSettings
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};
if (!isServer) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(maxRange), "maxRange"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(interval), "interval"] call EFUNC(common,readSettingFromModule);

_defaultLeadColor = call compile ("[" + (_logic getVariable ["defaultLeadColor", ""]) + "]");
if (!([_defaultLeadColor] call FUNC(isValidColorArray))) exitWith {ERROR("defaultLeadColor is not a valid color array.")};

_defaultColor = call compile ("[" + (_logic getVariable ["defaultColor", ""]) + "]");
if (!([_defaultColor] call FUNC(isValidColorArray))) exitWith {ERROR("defaultColor is not a valid color array.")};

[QGVAR(defaultLeadColor), _defaultLeadColor, false, true] call EFUNC(common,setSetting);
[QGVAR(defaultColor), _defaultColor, false, true] call EFUNC(common,setSetting);
