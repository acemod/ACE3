#include "..\script_component.hpp"
/*
 * Author: commy2
 * Reports a blood type depending on the unit's name.
 *
 * Arguments:
 * 0: Unit name <STRING>
 *
 * Return Value:
 * A random blood type <STRING>
 *
 * Example:
 * "name" call ace_dogtags_fnc_bloodType
 *
 * Public: No
 */

#define BLOOD_TYPES ["O POS", "O NEG", "A POS", "A NEG", "B POS", "B NEG", "AB POS", "AB NEG"]

params ["_name"];

private _num = 0;
private _count = {_num = _num + _x} count toArray _name;

_num = _num + _count;

BLOOD_TYPES select (_num % count BLOOD_TYPES)
