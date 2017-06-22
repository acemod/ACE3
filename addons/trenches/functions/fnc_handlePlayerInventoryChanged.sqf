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
 * [bob, "weapon"] call ace_trenches_fnc_handlePlayerInverntoryChanged
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    if !("ACE_EntrenchingTool" in items _unit) then {
        [_unit] call FUNC(placeCancel);
    };
};
