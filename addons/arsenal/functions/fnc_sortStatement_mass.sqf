#include "script_component.hpp"
/*
 * Author: Alganthe, SynixeBrett
 * Statement for the mass sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Number to sort by
 *
 * Public: No
*/

params ["_config"];

private _mass = getNumber (_config >> "mass");

if (_mass == 0 && {isClass (_config >> "itemInfo")}) then {
    _mass = getNumber (_config >> "itemInfo" >> "mass");
};

if (_mass == 0 && {isClass (_config >> "WeaponSlotsInfo")}) then {
    _mass = getNumber (_config >> "WeaponSlotsInfo" >> "mass");
};

_mass
