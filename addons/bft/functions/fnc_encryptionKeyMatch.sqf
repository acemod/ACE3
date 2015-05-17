/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_keySetTwo", "_keySetOne", "_return"];
_keySetOne = _this select 0;
_keySetTwo = _this select 1;

_return = false;
{
    if (_x in _keySetTwo) exitwith {_return = true;};
}foreach _keySetOne;

_return;