/*
 * Author: KoffeinFlummi
 * Checks if a unit is in a engineeral vehicle.
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 *
 * Return Value:
 * Is unit in engineeral vehicle? <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_vehicle"];

_unit = _this select 0;
_nearObjects = nearestObjects [_unit, ["Air","LandVehicle"], 20];

_return = false;
{
    if ([_x] call FUNC(isRepairVehicle)) exitwith {_return = true;};
}foreach _nearObjects;

_return;
