/*
 * Author: Ruthberg
 * Pick up sandbag
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: sandbag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _sandbag] call ace_sandbag_fnc_pickup
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_sandbag"];

[_unit, "PutDown"] call EFUNC(common,doGesture);

_unit setVariable [QGVAR(isUsingSandbag), true];

[{
    params ["_unit", "_sandbag"];

    _unit setVariable [QGVAR(isUsingSandbag), false];

    if (isNull _sandbag) exitWith {};

    deletevehicle _sandbag;

    // Force physx update
    {
        _x setPosASL (getPosASL _x);
    } count (_unit nearObjects ["ACE_SandbagObject", 5]);

    [_unit, "ACE_Sandbag_empty"] call EFUNC(common,addToInventory);
}, [_unit, _sandbag], 1.5] call CBA_fnc_waitAndExecute;
