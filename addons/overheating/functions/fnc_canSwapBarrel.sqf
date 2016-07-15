/*
 * Author: Grey-Soldierman
 * Return true if player can swap barrel
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 * Return Value:
 * Bool
 *
 * Public: No
 */
#include "script_component.hpp"
params["_unit","_weapon"];
private ["_canSwapBarrel","_weaponBarrelClass"];
//Get the classname of the spare barrel for the weapon
_weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> _weapon >> 'ACE_Overheating_barrelClassname');
//If the weapon has no defined classname then use the ACE one
if(_weaponBarrelClass == "") then {
    _weaponBarrelClass = 'ACE_SpareBarrel';
};
//Check if the player has the barrel and the weapon can have its barrel swapped
_canSwapBarrel = GVAR(enabled) && {_weaponBarrelClass in magazines _unit} && {getNumber (configFile >> 'CfgWeapons' >> _weapon >> 'ACE_Overheating_allowSwapBarrel') == 1};

_canSwapBarrel;