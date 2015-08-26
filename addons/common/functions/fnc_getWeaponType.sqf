/*
 * Author: commy2
 * Check what kind of weapon the given class name is. (primary, secondary or handgun)
 *
 * Arguments:
 * 0: Weapons <STRING>
 *
 * Return Value:
 * Slot index <NUMBER>
 *   1 = primary
 *   2 = secondary
 *   3 = handgun
 *   -1 = other
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_type", "_index"];

params ["_weapon"];

_type = [getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")] call FUNC(binarizeNumber);

_index = 0;

while {!(_type select _index) && {_index < 16}} do {
    _index = _index + 1;
};

switch (_index) do {
    case 0 : {1};
    case 1 : {3};
    case 2 : {2};
    default {-1};
}
