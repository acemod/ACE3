#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Picks up a sandbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sandbag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_sandbag_fnc_pickup
 *
 * Public: No
 */

params ["_unit", "_sandbag"];

[_unit, "PutDown"] call EFUNC(common,doGesture);

_unit setVariable [QGVAR(isUsingSandbag), true];

[{
    params ["_unit", "_sandbag"];

    _unit setVariable [QGVAR(isUsingSandbag), false];

    // If another unit picked up the sandbag or otherwise sandbag no longer present, exit
    if (!alive _unit || {!alive _sandbag}) exitWith {};

    private _nearSandbags = (_sandbag nearObjects ["ACE_SandbagObject", 5]) - [_sandbag];

    deleteVehicle _sandbag;

    // Force PhysX update
    {
        [QEGVAR(common,awake), [_x, true]] call CBA_fnc_globalEvent;
    } forEach _nearSandbags;

    [_unit, "ACE_Sandbag_empty"] call EFUNC(common,addToInventory);
}, [_unit, _sandbag], 1] call CBA_fnc_waitAndExecute;
