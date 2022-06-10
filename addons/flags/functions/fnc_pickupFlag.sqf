#include "script_component.hpp"
/*
 * Author: Timi007
 * Picks up flag and adds item to unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flag item <STRING>
 * 2: Flag pole (gets deleted later) <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_flags_fnc_pickupFlag
 *
 * Public: No
 */

params ["_unit", "_item", "_flag"];
TRACE_3("Flag pickup", _unit, _item, _flag);

[_unit, "PutDown"] call EFUNC(common,doGesture);

[{
    params ["_unit", "_item", "_flag"];

    [_unit, _item] call EFUNC(common,addToInventory);
    deleteVehicle _flag;
}, [_unit, _item, _flag], 0.7] call CBA_fnc_waitAndExecute;
