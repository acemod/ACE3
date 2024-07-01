#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns reload action for a given weapon/muzzle combination, used in reload mutex
 *
 * Arguments:
 * 0: Weapon classname <STRING>
 * 1: Muzzle classname <STRING>
 *
 * Return Value:
 * Reload animation classname, lowercase <STRING>
 *
 * Example:
 * ["arifle_SPAR_01_blk_F","arifle_SPAR_01_blk_F"] call ace_common_fnc_getReloadAction
 *
 * Public: No
 */

params ["_weapon", "_muzzle"];

GVAR(reloadActionsCache) getOrDefaultCall [[_weapon, _muzzle], {
    private _wpnMuzzleCfg = configFile >> "CfgWeapons" >> _weapon;
    if (_muzzle isNotEqualTo _weapon) then { _wpnMuzzleCfg = _wpnMuzzleCfg >> _muzzle};
    toLowerANSI getText (_wpnMuzzleCfg >> "reloadAction") // return
}, true];
