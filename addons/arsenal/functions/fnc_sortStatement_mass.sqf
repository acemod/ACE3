#include "script_component.hpp"
/*
 * Author: Alganthe, Brett Mayson
 * Statement to sort items by their mass.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER>
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
