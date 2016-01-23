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
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isDigging), false]) then {
    if !("ACE_EntrenchingTool" in items _unit) then {
        [_unit] call FUNC(digCancel);
    };
};
