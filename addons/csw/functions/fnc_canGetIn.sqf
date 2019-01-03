/*
 * Author: TCVM
 * Checks if the player can get in the weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_canGetIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_staticWeapon"];
private _locked = locked _staticWeapon;

alive _staticWeapon && { !(alive (gunner _staticWeapon)) && { _locked != 2 && _locked != 3; } }

