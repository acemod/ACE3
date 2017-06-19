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
 * [bob, "weapon"] call ace_sandbag_fnc_handlePlayerInventoryChanged
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    if !("ACE_Sandbag_empty" in items _unit) then {
        [_unit] call FUNC(deployCancel);
    };
};
