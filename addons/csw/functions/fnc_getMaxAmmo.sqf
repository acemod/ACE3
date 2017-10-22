/*
 * Author: TCVM
 * Returns the max ammo of the CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Max ammo of CSW <NUMBER>
 *
 * Example:
 * [CSW] call ace_csw_fnc_getMaxAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw"];

private _cswWeapon = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _cswMagazines = getArray(configFile >> "CfgWeapons" >> _cswWeapon >> "magazines");
private _maxAmmo = -1;

{
    if (_x find "Dummy" >= 0) exitWith {_maxAmmo = getNumber(configFile >> "CfgMagazines" >> _x >> "count"); true };
} forEach _cswMagazines;

_maxAmmo

