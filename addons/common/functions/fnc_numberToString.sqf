/*
 * Author: commy2
 *
 * Converts a number to a string without losing as much precission as str or format.
 *
 * Argument:
 * 0: A number (Number)
 *
 * Return value:
 * The number as string (String)
 */
#include "script_component.hpp"

private ["_number", "_decimals"];

_number = _this select 0;

_decimals = str (_number mod 1);

_decimals = toArray _decimals;
_decimals deleteAt 0;

format ["%1%2", floor _number, toString _decimals];
