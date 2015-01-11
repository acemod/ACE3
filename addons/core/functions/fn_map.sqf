/*
 * Author: KoffeinFlummi, commy2
 *
 * Applies given code to every element in an array, LIKE SOMETHING SQF SHOULD HAVE BY DEFAULT.
 *
 * Arguments:
 * 0: Array to be thingied.
 * 1: Code to be applied to every element.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [["2", "gobblecock", "25"], {parseNumber _this}] call FUNC(map) ==> [2, 0, 25]
 */

private ["_array", "_code"];

_array = + _this select 0;
_code = _this select 1;

if (isNil "_array") exitWith {
  diag_log text format ["[AGM] ERROR: No array for function map in %1", _fnc_scriptNameParent];
  []
};

{
  _array set [_forEachIndex, _x call _code];
} forEach _array;
_array
