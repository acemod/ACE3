/*
 * Author: commy2
 * Converts a number to a string without losing as much precission as str or format.
 *
 * Arguments:
 * 0: A number <NUMBER>
 *
 * Return Value:
 * The number as string <STRING>
 *
 * Example:
 * [5] call ace_common_fnc_numberToString
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_number"];

private _decimals = str (abs _number mod 1);
_decimals = toArray _decimals;
_decimals deleteAt 0;

if (_number < 0) exitWith {
    format ["-%1%2", floor abs _number, toString _decimals];
};
format ["%1%2", floor _number, toString _decimals];
