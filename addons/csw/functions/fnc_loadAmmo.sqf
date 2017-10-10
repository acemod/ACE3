/*
 * Author: TCVM
 * Loads ammo into the CSW and removes it from the player inventory
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CSW, player] call ace_csw_fnc_loadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw", "_player"];

private _cswWeapon = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _cswMagazines = getArray(configFile >> "CfgWeapons" >> _cswWeapon >> "magazines");

private _magazineSelected = "";
private _magazineAmmoCount = 0;

{
	if ((_x select 0) in _cswMagazines && (_csw ammo _cswWeapon) + (_x select 1) <= [_csw] call FUNC(getMaxAmmo)) exitWith {
		_magazineSelected = _x select 0;
		_magazineAmmoCount = _x select 1;
		true
	};
} forEach magazinesAmmoFull(_player select 1);

if (_magazineAmmoCount == 0) then {
	hint "No room for ammo";
} else {
	_csw setAmmo [_cswWeapon, ((_csw ammo _cswWeapon) + _magazineAmmoCount)];
	(_player select 1) removeMagazineGlobal _magazineSelected;
}