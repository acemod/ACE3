#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Gets all placed explosives by unit, optionally filtered by specific trigger type.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger classname - filter (optional) <STRING>
 *
 * Return Value:
 * Explosives <ARRAY>
 *
 * Example:
 * _allExplosives = [player] call ACE_Explosives_fnc_getPlacedExplosives;
 * _deadmanExplosives = [player, "DeadManSwitch"] call ACE_Explosives_fnc_getPlacedExplosives;
 *
 * Public: Yes
 */
// IGNORE_PRIVATE_WARNING(_allExplosives,_deadmanExplosives);

params ["_unit"];
TRACE_1("params",_unit);

private _filter = nil;
if (count _this > 1) then {
    _filter = ConfigFile >> "ACE_Triggers" >> (_this select 1);
};
private _clackerList = [];
private _adjustedList = false;
_clackerList = _unit getVariable [QGVAR(Clackers), []];
private _list = [];
{
    if (isNull (_x select 0)) then {
        _clackerList set [_forEachIndex, "X"];
        _adjustedList = true;
    } else {
        if (isNil "_filter" || {(ConfigFile >> "ACE_Triggers" >> (_x select 4)) == _filter}) then {
            _list pushBack _x;
        };
    };
} forEach _clackerList;
if (_adjustedList) then {
    _clackerList = _clackerList - ["X"];
    if (count _clackerList == 0) then {
        _unit setVariable [QGVAR(Clackers), nil, true];
    } else {
        _unit setVariable [QGVAR(Clackers), _clackerList, true];
    };
};

_list
