/*
 * Author: Garth 'L-H' de Wet
 * Gets the explosive from the speed dial entry.
 *
 * Arguments:
 * 0: Speed dial entry <STRING>
 *
 * Return Value:
 * Associated explosive (or ObjNull) <OBJECT>
 *
 * Example:
 * ["2113"] call ace_explosives_fnc_getSpeedDialExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_code"];
TRACE_1("params",_code);

if (isNil QGVAR(CellphoneIEDs)) exitWith {[]};
private _explosive = [];
{
    if ((_x select 1) == _code) exitWith {
        _explosive = _x;
    };
    false
} count GVAR(CellphoneIEDs);

_explosive
