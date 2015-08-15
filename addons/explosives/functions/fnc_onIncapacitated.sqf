/*
 * Author: Garth 'L-H' de Wet
 * Detonates all attached deadman's switched triggered explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * Handled by CBA
 *
 * Public: No
 */
#include "script_component.hpp"

//NOTE: Extended_Killed_EventHandlers runs only where _unit is local
params ["_unit"];
TRACE_1("params",_unit);

private ["_deadman"];

_deadman = [_unit, "DeadManSwitch"] call FUNC(getPlacedExplosives);
{
    [_unit, -1, _x, true] call FUNC(detonateExplosive);
} forEach _deadman;
