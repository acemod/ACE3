/*
 * Authors: Ruthberg
 * Updates the ammo and weapon class names
 *
 * Arguments:
 * unit <OBJECT>
 *
 * Return Value:
 * Update successful? <BOOLEAN>
 *
 * Example:
 * unit call ace_rangecard_fnc_updateClassNames
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_ammoClass", "_weaponClass", "_ammo", "_ammoConfig", "_parentClasses"];
_unit = _this;

_ammoClass = "";
_weaponClass = primaryWeapon _unit;

if (_weaponClass == "") exitWith { (GVAR(ammoClass) != "" && GVAR(weaponClass) != "") }; 

{
    _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
    _ammoConfig = (configFile >> "CfgAmmo" >> _ammo);
    _parentClasses = [_ammoConfig, true] call BIS_fnc_returnParents;
    if ("BulletBase" in _parentClasses) exitWith { _ammoClass = _ammo; };
} forEach (primaryWeaponMagazine _unit);

if (_ammoClass == "") exitWith { (GVAR(ammoClass) != "" && GVAR(weaponClass) != "") };

if (_unit == ACE_player) then {
    GVAR(ammoClass) = _ammoClass;
    GVAR(weaponClass) = _weaponClass;
} else {
    GVAR(ammoClassCopy) = _ammoClass;
    GVAR(weaponClassCopy) = _weaponClass;
};

true
