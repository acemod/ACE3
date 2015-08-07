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
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_decimals"];

params ["_number"];

_decimals = str (abs(_number) mod 1);
_decimals = toArray _decimals;
_decimals deleteAt 0;

if (_number < 0) exitWith {
    format ["-%1%2", floor abs(_number), toString _decimals];
};
format ["%1%2", floor _number, toString _decimals];
