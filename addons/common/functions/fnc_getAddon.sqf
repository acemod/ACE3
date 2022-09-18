#include "script_component.hpp"
/*
 * Author: johnb43
 * Returns a config's addon.
 *
 * Arguments:
 * 0: Config entry <CONFIG>
 *
 * Return Value:
 * Addon name <STRING>
 *
 * Example:
 * [configFile >> "CfgWeapons" >> "arifle_AK12_F"] call ace_common_fnc_getConfigName
 *
 * Public: Yes
*/

params ["_config"];

// Check if item is cached
private _addon = (uiNamespace getVariable QGVAR(addonCache)) get _config;

if (!isNil "_addon") exitWith {
    _addon
};

private _addons = configSourceAddonList _config;

// Return first addon
_addon = if (_addons isNotEqualTo []) then {
    (configSourceModList (configfile >> "CfgPatches" >> _addons select 0)) param [0, ""]
} else {
    // If nothing found at all, return ""
    ""
};

(uiNamespace getVariable QGVAR(addonCache)) set [_config, _addon];

_addon
