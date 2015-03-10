/*
 * Author: bux, commy2
 *
 * Handle the open inventory event. Don't open the inventory if it's locked and display message.
 * 
 * Argument:
 * Input from "InventoryOpened" eventhandler
 * 
 * Return value:
 * Don't open the inventory dialog? (Bool)
 */
#include "script_component.hpp"

private ["_target", "_isBackpack", "_isLocked", "_return"];

_target = _this select 1;

_isBackpack = [_target] call FUNC(isBackpack);
_isLocked = _target getVariable ["ACE_LockedInventory", false];

_return = false;
if (_isBackpack) then {
    // target is a backpack
    private "_unit";
    _unit = [_target] call FUNC(getBackpackAssignedUnit);

    if (!alive _unit || {_unit getVariable ["ACE_isUnconscious", false]}) exitWith {};

    if (_isLocked) then {
        // target is a locked backpack
        [format [localize "STR_ACE_LockBackpacks_BackpackLocked", [_unit] call EFUNC(common,getName)]] call EFUNC(common,displayTextStructured);
        _return = true;
    } else {
        // target is a not-locked backpack
        if (_unit getVariable ["ACE_LockedInventory", false]) then {
            [localize "STR_ACE_LockBackpacks_InventoryLocked"] call EFUNC(common,displayTextStructured);
            _return = true;
        };
    };
} else {
    // target is not a backpack
    if (_isLocked) then {
        [localize "STR_ACE_LockBackpacks_InventoryLocked"] call EFUNC(common,displayTextStructured);
        _return = true;
    };
};
_return
