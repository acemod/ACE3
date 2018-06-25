#include "script_component.hpp"
/*
 * Author: commy2
 * Check what kind of weapon the given class name is.
 *
 * Arguments:
 * 0: Weapons <STRING>
 *
 * Return Value:
 * Slot index <NUMBER>
 *   1 = primary
 *   2 = secondary
 *   3 = handgun
 *  -1 = other
 *
 * Example:
 * ["gun"] call ace_common_fnc_getWeaponType
 *
 * Public: Yes
 */

params ["_weapon"];

private _type = [getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")] call FUNC(binarizeNumber);

private _index = 0;

while {!(_type select _index) && {_index < 16}} do {
    _index = _index + 1;
};

[-1, 1, 3, 2] select (([0, 1, 2] find _index) + 1) // return
