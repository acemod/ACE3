/*
 * Author: TCVM
 * Unloads ammo out of the CSW and places it onto the ground
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * How much ammo was removed <NUMBER>
 *
 * Example:
 * [CSW] call ace_csw_fnc_unloadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw"];

private _weaponPos = _csw getRelPos[1.5, 270];
private _weaponMagazineClassname = "";
private _ammo = magazinesAmmoFull _csw;
private _weaponTurret = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _weaponMagazines = getArray(configFile >> "CfgWeapons" >> _weaponTurret >> "magazines");

// Create magazine holder and spawn the ammo that was in the weapon
private _ammoHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
_ammoHolder setPosATL _weaponPos;

{
	if !((_x find "Dummy") >= 0) exitWith { _weaponMagazineClassname = _x; true};
} forEach _weaponMagazines;

private _maxMagazineCapacity = getNumber(configFile >> "CfgMagazines" >> _weaponMagazineClassname >> "count");
private _magazineAmmoCount = (_ammo select 0) select 1;

_ammoHolder addMagazineAmmoCargo[_weaponMagazineClassname, 1, _magazineAmmoCount min _maxMagazineCapacity];
_csw setAmmo [_weaponTurret, ((_csw ammo _weaponTurret) - (_magazineAmmoCount min _maxMagazineCapacity))];

_magazineAmmoCount min _maxMagazineCapacity