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

private _return = 0;

if (_unit isKindOf "CAManBase") then {
    _return = {_x == _magazine} count magazines _unit;
} else {
    {
        _return = _return + ({_x == _magazine} count magazines _x);
        false
    } count crew _unit;

    (getMagazineCargo _unit) params [["_magNames", []], ["_magCount", []]];
    {
        if (_magazine == _x) exitWith {_return = _return + (_magCount select _forEachIndex)};
    } forEach _magNames;
};

_return
