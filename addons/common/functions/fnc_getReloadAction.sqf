#include "script_component.hpp"
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

private _return = GVAR(reloadActionsCache) get [_weapon, _muzzle];

if (isNil "_return") then {
    private _wpnMuzzleCfg = configFile >> "CfgWeapons" >> _weapon;
    if (_muzzle isNotEqualTo _weapon) then { _wpnMuzzleCfg = _wpnMuzzleCfg >> _muzzle};
    _return = toLower getText (_wpnMuzzleCfg >> "reloadAction");
    GVAR(reloadMutex_reloadActionsCache) set [[_weapon, _muzzle], _return];
};

_return
