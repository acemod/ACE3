/*
 * Author: Garth 'L-H' de Wet
 * Returns all the detonators of the unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Configs of all detonators <ARRAY>
 *
 * Example:
 * _detonators = [player] call ACE_Explosives_fnc_getDetonators;
 *
 * Public: Yes
 */
#include "script_component.hpp"
// IGNORE_PRIVATE_WARNING(_detonators);

params ["_unit"];
TRACE_1("params",_unit);

private ["_items", "_result", "_config"];

_items = (items _unit);
_result = [];

{
    _config = ConfigFile >> "CfgWeapons" >> _x;
    if (getNumber (_config >> "ACE_Detonator") == 1 && {!(_x in _result)}) then {
        _result pushBack _x;
    };
} forEach _items;

_result
