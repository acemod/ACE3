#include "script_component.hpp"
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

params ["_unit"];

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    if !([_unit, "ACE_Sandbag_empty"] call EFUNC(common,hasItem)) then {
        [_unit] call FUNC(deployCancel);
    };
};
