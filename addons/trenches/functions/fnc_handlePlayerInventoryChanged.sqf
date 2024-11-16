#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handle the InventoryChanged event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "weapon"] call ace_trenches_fnc_handlePlayerInventoryChanged
 *
 * Public: No
*/

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    if !(_unit call FUNC(hasEntrenchingTool)) then {
        [_unit] call FUNC(placeCancel);
    };
};
