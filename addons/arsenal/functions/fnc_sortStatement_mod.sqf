#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Statement to sort items by the mod they belong to.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Mod Name to Sort By <STRING>
 *
 * Public: No
*/

params ["_config"];

private _dlc = "";
if !(_addons isEqualTo []) then {
private _addons = configSourceAddonList _config;
    private _mods = configSourceModList (configfile >> "CfgPatches" >> _addons select 0);
    if !(_mods isEqualTo []) then {
        _dlc = _mods select 0;
    };
};

modParams [_dlc, ["name"]] param [0, ""]
