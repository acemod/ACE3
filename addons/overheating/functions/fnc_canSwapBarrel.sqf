/*
 * Author: Grey-Soldierman
 * Return true if player can swap barrel
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Bool <BOOL>
 *
 * Example:
 * [bob, "weapon"] call ace_overheating_fnc_canSwapBarrel
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit","_weapon"];

//Check if weapon can have its barrel swapped. If not exit out of function
if( !GVAR(enabled) && (getNumber (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(allowSwapBarrel))) != 1) exitWith{false};

//Get the classname of the spare barrel for the weapon
private _weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(barrelClassname));
//If the weapon has no defined classname then use the ACE one
if(_weaponBarrelClass == "") then {
    _weaponBarrelClass = "ACE_SpareBarrel";
};
//If the player has the spare barrel then it can be swapped
(_weaponBarrelClass in magazines _unit)
