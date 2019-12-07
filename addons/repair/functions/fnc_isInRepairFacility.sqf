#include "script_component.hpp"
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

params [["_object", objNull, [objNull]]];
TRACE_1("params",_object);

private _position = getPosASL _object;
private _isInBuilding = false;

private _checkObject = {
    if (
        _x getVariable ["ACE_isRepairFacility", getNumber (configFile >> "CfgVehicles" >> typeOf _x >> QGVAR(canRepair))] > 0
        && {!(_x isKindOf "AllVehicles")} // check if it's not repair vehicle
        && {alive _x}
    ) exitWith {
        _isInBuilding = true;
    };
};

private _objects = (lineIntersectsWith [_object modelToWorldVisual [0, 0, (_position select 2)], _object modelToWorldVisual [0, 0, (_position select 2) +10], _object]);
_checkObject forEach _objects;

if (_isInBuilding) exitWith {true};

_objects = _object nearObjects 7.5;
_checkObject forEach _objects;

_isInBuilding
