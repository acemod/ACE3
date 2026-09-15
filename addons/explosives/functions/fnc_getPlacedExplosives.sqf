#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Gets all placed explosives by unit, optionally filtered by specific trigger type.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Trigger classname to filter by <STRING> (default: "")
 *
 * Return Value:
 * Explosives <ARRAY>
 *
 * Example:
 * _allExplosives = player call ace_explosives_fnc_getPlacedExplosives
 * _deadmanExplosives = [player, "DeadManSwitch"] call ace_explosives_fnc_getPlacedExplosives
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_filter", "", [""]]];
TRACE_1("params",_unit);

if (isNull _unit) exitWith {
    [] // return
};

private _clackerList = _unit getVariable [QGVAR(clackers), []];
private _list = [];
private _adjustedList = false;
private _cfgAceTriggers = configFile >> "ACE_Triggers";

// Filter out any invalid explosives (this is the garbage collector)
// forEachReversed can't be used, as _list's order should be maintained
{
    if (isNull (_x select 0)) then {
        _clackerList set [_forEachIndex, "X"];

        _adjustedList = true;
    } else {
        if (_filter == "" || {configName (_cfgAceTriggers >> _x select 4) == _filter}) then {
            _list pushBack _x;
        };
    };
} forEach _clackerList;

if (_adjustedList) then {
    _clackerList = _clackerList - ["X"];

    _unit setVariable [QGVAR(clackers), _clackerList, true];
};

_list // return
