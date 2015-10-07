/*
 * Author: Glowbal
 * Count magazines of unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine <STRING>
 *
 * Return Value:
 * Magazine amount <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_magazine"];

private "_return";
_return = 0;

if (_unit isKindOf "CAManBase") then {
    _return = {_x == _magazine} count magazines _unit;
} else {
    {
        _return = _return + {_x == _magazine} count magazines _x;
        false
    } count crew _unit;

    _return = _return + ({_x == _magazine} count getMagazineCargo _unit);
};

_return
