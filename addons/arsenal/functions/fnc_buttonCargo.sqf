#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Add or remove item(s) when the + or - button is pressed in the right panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Add or remove <NUMBER> (-1: Remove, 1: Add)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_addOrRemove"];

_addOrRemove = _addOrRemove > 0;

private _ctrlList = _display displayCtrl IDC_rightTabContentListnBox;
private _lnbCurSel = lnbCurSelRow _ctrlList;

// If item is unique, don't allow adding more
if (_addOrRemove && {(_ctrlList lnbValue [_lnbCurSel, 2]) == 1}) exitWith {};

private _containerItems = [];
private _item = _ctrlList lnbData [_lnbCurSel, 0];

// Update item count and currentItems array & get relevant container
private _container = switch (GVAR(currentLeftPanel)) do {
    // Uniform
    case IDC_buttonUniform: {
        if (_addOrRemove) then {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) addItemToUniform _item;
            };
        } else {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) removeItemFromUniform _item;
            };
        };

        _containerItems = uniformItems GVAR(center);

        // Update currentItems
        GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, ((getUnitLoadout GVAR(center)) select IDX_LOADOUT_UNIFORM) param [1, []]];

        // Update load bar
        (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadUniform GVAR(center));

        uniformContainer GVAR(center)
    };
    // Vest
    case IDC_buttonVest: {
        if (_addOrRemove) then {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) addItemToVest _item;
            };
        } else {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) removeItemFromVest _item;
            };
        };

        _containerItems = vestItems GVAR(center);

        // Update currentItems
        GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, ((getUnitLoadout GVAR(center)) select IDX_LOADOUT_VEST) param [1, []]];

        // Update load bar
        (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadVest GVAR(center));

        vestContainer GVAR(center)
    };
    // Backpack
    case IDC_buttonBackpack: {
        if (_addOrRemove) then {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) addItemToBackpack _item;
            };
        } else {
            for "_i" from 1 to ([1, 5] select GVAR(shiftState)) do {
                GVAR(center) removeItemFromBackpack _item;
            };
        };

        _containerItems = backpackItems GVAR(center);

        // Update currentItems
        GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, ((getUnitLoadout GVAR(center)) select IDX_LOADOUT_BACKPACK) param [1, []]];

        // Update load bar
        (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadBackpack GVAR(center));

        backpackContainer GVAR(center)
    };
};

// Find out how many items of that type there are and update the number displayed
_ctrlList lnbSetText [[_lnbCurSel, 2], str ({_x == _item} count _containerItems)];

//////////////////// Return NUMBER, as it did before or return BOOL, as the doc says is should ?
[QGVAR(cargoChanged), [_display, _item, _addOrRemove, GVAR(shiftState)]] call CBA_fnc_localEvent;

// Refresh availibility of items based on space remaining in container
[_ctrlList, _container, _containerItems isNotEqualTo []] call FUNC(updateRightPanel);
