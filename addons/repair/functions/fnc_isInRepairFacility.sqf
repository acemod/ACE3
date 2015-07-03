/*
 * Author: Glowbal
 * Checks if a unit is in a designated engineeral facility
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Is in engineeral facility <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_object","_position","_objects","_isInBuilding","_repairFacility"];
_object = _this select 0;
_position = getPosASL _object;
_isInBuilding = false;
_repairFacility = [];

_objects = (lineIntersectsWith [_object modelToWorldVisual [0, 0, (_position select 2)], _object modelToWorldVisual [0, 0, (_position select 2) +10], _object]);
{
    if (((typeOf _x) in _repairFacility) || (_x getVariable [QGVAR(isRepairFacility),false])) exitwith {
        _isInBuilding = true;
    };
}foreach _objects;

if (!_isInBuilding) then {
    _objects = position _object nearObjects 7.5;
    {
        if (((typeOf _x) in _repairFacility) || (_x getVariable [QGVAR(isRepairFacility),false])) exitwith {
            _isInBuilding = true;
        };
    }foreach _objects;
};
_isInBuilding;
