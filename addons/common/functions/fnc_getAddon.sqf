#include "..\script_component.hpp"
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
 * [configFile >> "CfgWeapons" >> "arifle_AK12_F"] call ace_common_fnc_getAddon
 *
 * Public: Yes
*/

params ["_config"];

(uiNamespace getVariable QGVAR(addonCache)) getOrDefaultCall [_config, {
    private _addons = configSourceAddonList _config;

    // Return first addon
    if (_addons isNotEqualTo []) then {
        (configSourceModList (configFile >> "CfgPatches" >> _addons select 0)) param [0, ""]
    } else {
        // If nothing found at all, return ""
        ""
    }
}, true]
