#include "script_component.hpp"
/*
 * Author: johnb43
 * Returns an item's config case sensitive name.
 *
 * Arguments:
 * 0: Class name (item or object) <STRING>
 *
 * Return Value:
 * Config case item name ("" if config is not found) <STRING>
 *
 * Example:
 * ["arifle_AK12_F"] call ace_common_fnc_getConfigName
 *
 * Public: Yes
*/

params ["_className"];

_className = toLower _className;

// Check if item is cached
private _configName = (uiNamespace getVariable QGVAR(configNames)) get _className;

if (!isNil "_configName") exitWith {
    _configName
};

private _config = configNull;

{
    _config = configFile >> _x >> _className;

    if (isClass _config) exitWith {};
} forEach ["CfgWeapons", "CfgMagazines", "CfgGlasses", "CfgVehicles", "CfgVoice", "CfgUnitInsignia"];

_configName = configName _config;

// Save, regardless of its existence
(uiNamespace getVariable QGVAR(configNames)) set [_className, _configName];

_configName
