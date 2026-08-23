#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Adds event handlers when opening the inventory display.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_display"];

[_display] call FUNC(updateInventory);

// Add event handlers for dragging something onto the secondary slot
private _primarySlot = _display displayCtrl IDC_PRIMARY_SLOT;
_primarySlot ctrlAddEventHandler ["MouseButtonDown", FUNC(onDrag)];

{
    private _ctrl = _display displayCtrl _x;
    _ctrl ctrlAddEventHandler ["LBDrag", FUNC(onDrag)];
} forEach [
    IDC_GROUND_CONTAINER,
    IDC_SOLDIER_CONTAINER,
    IDC_UNIFORM_CONTAINER,
    IDC_VEST_CONTAINER,
    IDC_BACKPACK_CONTAINER
];

// Add event handler for dragging the weapon on back to a container
private _secondarySlot = _display displayCtrl IDC_SECONDARY_SLOT;
_secondarySlot ctrlAddEventHandler ["MouseButtonDown", FUNC(onDragWOB)];

// Add event handler for right click dropping a weapon into a container
_secondarySlot ctrlAddEventHandler ["MouseButtonClick", {
    params ["", "_mouseButton"];

    if (_mouseButton == 1 && {ACE_player in GVAR(units)}) then {
        [{
            secondaryWeapon ACE_player != QGVAR(weapon)
        }, {
            [] call FUNC(onDropWOB);
        }, [], 5] call CBA_fnc_waitUntilAndExecute;
    };
}];
