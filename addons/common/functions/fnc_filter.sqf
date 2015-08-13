/*
 * Author: KoffeinFlummi, commy2
 *
 * Filters array and removes every element not fitting the condition
 *
 * Arguments:
 * 0: Array to be filtered.
 * 1: Code to be evaluated.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [[0,1,2,3,4], {_this > 2}] call FUNC(filter) ==> [3,4]
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_newArray", "_index"];

params ["_array", "_code"];

if (isNil "_array") exitWith {
  diag_log text format ["[ACE] ERROR: No array for function filter in %1", _fnc_scriptNameParent];
  []
};

_newArray = [];
for "_index" from 0 to (count _array - 1) do {
    if ((_array select _index) call _code) then {
        _newArray pushBack (_array select _index);
    };
};
_newArray
