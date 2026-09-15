#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Updates the ammo and weapon class names.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player] call ace_rangecard_fnc_updateClassNames
 *
 * Public: No
 */

params ["_target", "_unit"];

private _weaponClass = primaryWeapon _target;

if (_weaponClass == "") exitWith {};

private _ammoClass = "";
private _magazineClass = "";
private _cfgMagazines = configFile >> "CfgMagazines";

{
    _ammoClass = getText (_cfgMagazines >> _x >> "ammo");

    if (_ammoClass isKindOf "BulletBase") exitWith {
        _magazineClass = _x;
    };
} forEach (primaryWeaponMagazine _target);

if (_magazineClass == "") exitWith {};

private _return = [
    _target call EFUNC(scopes,getCurrentZeroRange),
    [_target, 0] call EFUNC(scopes,getBoreHeight),
    _ammoClass,
    _magazineClass,
    _weaponClass
];

if (_target == _unit) then {
    GVAR(rangeCardInfo) = _return;
} else {
    GVAR(rangeCardCopyInfo) = _return;
};
