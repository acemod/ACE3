/*
 * Author: Alganthe
 * Text statement for the mass stat.
 *
 * Arguments:
 * 0: not used
 * 1: item config path (CONFIG)
 *
 * Return Value:
 * String to display 
 *
 * Public: No
*/
#include "script_component.hpp"

params ["", "_config"];

private _mass = getNumber (_config >> "mass");

if (_mass == 0 && {isClass (_config >> "itemInfo")}) then {
    _mass = getNumber (_config >> "itemInfo" >> "mass");
};

if (_mass == 0 && {isClass (_config >> "WeaponSlotsInfo")}) then {
    _mass = getNumber (_config >> "WeaponSlotsInfo" >> "mass");
};

format ["%1kg (%2lb)",((_mass * 0.1 * (1/2.2046) * 100) / 100) ToFixed 2, ((_mass * 0.1 * 100) / 100) ToFixed 2]
