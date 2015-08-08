/*
 * Author: Glowbal
 *
 * N/A
 *
 * Arguments:
 * 0: Unit (OBJECT)
 * 1: Magazine (STRING)
 *
 * Return Value:
 * Count of Input Magazine (NUMBER)
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_magazine"];

private ["_return"];

_return = 0;
if (_unit isKindOf "CAManBase") then {
    _return = {_x == _magazine} count magazines _unit;
} else {
    {
        _return = _return + {_x == _magazine} count magazines _x;
    } forEach (crew _unit);

    _return = _return + ({_x == _magazine} count getMagazineCargo _unit);
};

_return
