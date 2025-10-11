#include "..\script_component.hpp"
/*
 * Author: Garth de Wet (LH)
 * Takes a string/number and returns the number.
 *
 * Arguments:
 * 0: Value to attempt to convert to number or if number simply return number. <STRING or NUMBER>
 *
 * Return Value:
 * Number <NUMBER>
 *
 * Example:
 * number = ["102"] call ace_common_fnc_toNumber;
 *
 * Public: Yes
 */

params ["_value"];

if (_value isEqualType 0) exitWith {_value};

parseNumber _value // return
