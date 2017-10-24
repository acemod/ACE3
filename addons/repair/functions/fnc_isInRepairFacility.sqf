/*
 * Author: Glowbal
 * Checks if a unit is in a repair facility.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is inside a repair facility <BOOL>
 *
 * Example:
 * [unit] call ace_repair_fnc_isInRepairFacility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_object"];
TRACE_1("params",_object);

private _position = getPosASL _object;
private _isInBuilding = false;
private _repairFacility = [];

private _objects = (lineIntersectsWith [_object modelToWorldVisual [0, 0, (_position select 2)], _object modelToWorldVisual [0, 0, (_position select 2) +10], _object]);
{
    if (((typeOf _x) in _repairFacility) || (_x getVariable ["ACE_isRepairFacility",0]) > 0) exitWith {
        _isInBuilding = true;
    };
} forEach _objects;

if (!_isInBuilding) then {
    _objects = position _object nearObjects 7.5;
    {
        if (((typeOf _x) in _repairFacility) || (_x getVariable ["ACE_isRepairFacility",0]) > 0) exitWith {
            _isInBuilding = true;
        };
    } forEach _objects;
};
_isInBuilding;
