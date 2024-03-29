#include "..\script_component.hpp"
/*
 * Author: Grey-Soldierman
 * Return true if player can check temperatures of spare barrels
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Bool <BOOL>
 *
 * Example:
 * [bob] call ace_overheating_fnc_canCheckSpareBarrelsTemperatures
 *
 * Public: No
 */

params ["_player"];

//Get the classname of the spare barrel for the weapon
private _weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> currentWeapon _player >> QGVAR(barrelClassname));
//If the weapon has no defined classname then use the ACE one
if (_weaponBarrelClass == "") then {
    _weaponBarrelClass = "ACE_SpareBarrel";
};
//Check if the player has the barrel and the weapon can have its barrel swapped
private _canCheckTemperature = GVAR(enabled) && {_weaponBarrelClass in magazines _player};

_canCheckTemperature;
