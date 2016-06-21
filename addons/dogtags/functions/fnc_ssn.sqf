/*
 * Author: SilentSpike
 * Reports a social security number generated from the units name.
 *
 * Arguments:
 * 0: Name of a unit <STRING>
 *
 * Return Value:
 * A random social security number <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name"];

private _nums = ((toArray _name) select [0,9]) apply { _x % 10 };

while {count _nums < 9} do {
    _nums pushBack (floor random 10);
};

([_nums select [0,3],_nums select [3,2], _nums select [5,4]] apply { _x joinString "" }) joinString "-"
