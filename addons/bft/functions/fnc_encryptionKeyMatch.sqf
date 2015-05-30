/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: keySetOne <ARRAY>
 * 1: keySetTwo <ARRAY>
 *
 * Return Value:
 * has common keys? <BOOLEAN>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_keySetOne,_keySetTwo);

private ["_return"];
_return = false;
{
    if (_x in _keySetTwo) exitWith { _return = true; };
} forEach _keySetOne;

_return
