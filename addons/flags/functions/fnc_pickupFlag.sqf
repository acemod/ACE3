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

[_unit, "PutDown"] call EFUNC(common,doGesture);

[{((animationState _unit) select [25,7]) isEqualTo "putdown"}, {
    params ["_unit", "_item", "_flag"];

    [_unit, _item] call EFUNC(common,addToInventory);

    deleteVehicle _flag;
}, _this] call CBA_fnc_waitUntilAndExecute;
