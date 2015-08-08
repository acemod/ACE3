/*
 * Author: MikeMatrix
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
if (isNil "_leadColor" || !((typeName _leadColor) isEqualTo "ARRAY") || {count _leadColor != 4}) exitWith {};
[QGVAR(defaultLeadColor), _defaultLeadColor, true, true] call EFUNC(common,setSetting);

_defaultColor = call compile ("[" + (_logic getVariable ["defaultColor", ""]) + "]");
if (isNil "_color" || !((typeName _color) isEqualTo "ARRAY") || {count _color != 4}) exitWith {};
[QGVAR(defaultColor), _defaultColor, true, true] call EFUNC(common,setSetting);
