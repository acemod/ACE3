/*
 * Author: TCVM
 * Checks if the player can load ammo from the CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Load Ammo <BOOL>
 *
 * Example:
 * [CSW, player] call ace_csw_fnc_canLoadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw", "_player"];

// Get the weapon of the turret so we can see if it is a ACE CSW. If it isn't we won't bother trying to allow addition of ammo
private _cswWeapon = getArray(configFile >> "CfgVehicles" >> typeof(_csw) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
private _cswMagazines = getArray(configFile >> "CfgWeapons" >> _cswWeapon >> "magazines");

private _magExists = false;
private _maxAmmo = [_csw] call FUNC(getMaxAmmo);

{
    if (_x in _cswMagazines) exitWith { _magExists = true; true; };
} forEach magazines(_player select 1);

_magExists && (_csw ammo _cswWeapon < _maxAmmo)

