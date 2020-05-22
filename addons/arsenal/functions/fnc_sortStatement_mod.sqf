#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Statement for the mod sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Mod name to sort by
 *
 * Public: No
*/

private _dlc = "";
private _addons = configSourceAddonList _this;
if (count _addons > 0) then {
    private _mods = configSourceModList (configfile >> "CfgPatches" >> _addons select 0);
    if (count _mods > 0) then {
        _dlc = _mods select 0;
    };
};

(modParams [_dlc, ["name"]]) param [0, ""]
