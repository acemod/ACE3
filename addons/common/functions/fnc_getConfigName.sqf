#include "..\script_component.hpp"
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

(uiNamespace getVariable QGVAR(configNames)) getOrDefaultCall [toLower _className, {
    private _config = configNull;

    {
        _config = configFile >> _x >> _className;

        if (isClass _config) exitWith {};
    } forEach ["CfgWeapons", "CfgMagazines", "CfgGlasses", "CfgVehicles", "CfgVoice", "CfgUnitInsignia"];

    configName _config
}, true]
