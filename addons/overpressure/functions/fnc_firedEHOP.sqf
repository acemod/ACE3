/*
 * Author: joko // Jonas
 *
 * Handle fire of Other Weapons
 *
 * Arguments:
 * 0: Unit that fired <OBJECT>
 * 1: Weapon fired <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"
private ["_var","_varName"];
params ["", "_weapon", "", "", "_ammo", "_magazine", ""];

// Bake Variable Name and Check if the Variable Exist else call the Cache Function
_varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
_var = if (isNil _varName) then {
    ([_weapon, _ammo, _magazine] call FUNC(cacheOverPressureVales)) select 2;
} else {
    (missionNameSpace getVariable _varName) select 2;
};

if (_var > 0) then {
    _this call DFUNC(fireOverpressureZone)
};
