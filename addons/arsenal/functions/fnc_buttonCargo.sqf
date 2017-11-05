/*
 * Author: Alganthe
 * Add or remove item(s) when the + or - button is pressed in the right panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Add or remove <SCALAR> (-1: remove, 1: Add)
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_addOrRemove"];

private _load = 0;
private _maxLoad = "";
private _items = [];
private _ctrlList = (_display displayCtrl IDC_rightTabContentListnBox);
private _lnbCurSel = lnbCurSelRow _ctrlList;
private _item = _ctrlList lnbData [_lnbCurSel, 0];

if ((_ctrlList lnbValue [_lnbCurSel, 2]) == 1 && {_addOrRemove == 1}) exitWith {};

// Update item count and currentItems array
switch GVAR(currentLeftPanel) do {

    case IDC_buttonUniform : {
        if (_addOrRemove > 0) then {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) addItemToUniform _item;
                };
            } else {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) removeItemFromUniform _item;
                };
            };

        _load = loadUniform GVAR(center);
        _maxLoad = gettext (configfile >> "CfgWeapons" >> uniform GVAR(center) >> "ItemInfo" >> "containerClass");
        _items = uniformItems GVAR(center);
        GVAR(currentItems) set [15 ,_items];
    };

    case IDC_buttonVest : {
        if (_addOrRemove > 0) then {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) addItemToVest _item;
                };
            } else {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) removeItemFromVest _item;
                };
            };

        _load = loadVest GVAR(center);
        _maxLoad = gettext (configfile >> "CfgWeapons" >> vest GVAR(center) >> "ItemInfo" >> "containerClass");
        _items = vestItems GVAR(center);
        GVAR(currentItems) set [16,_items];
    };

    case IDC_buttonBackpack : {
        if (_addOrRemove > 0) then {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) addItemToBackpack _item;
                };
            } else {
                for "_count" from 1 to ([1, 5] select (GVAR(shiftState))) do {
                    GVAR(center) removeItemFromBackpack _item;
                };
            };

        _load = loadBackpack GVAR(center);
        _maxLoad = backpack GVAR(center);
        _items = backpackItems GVAR(center);
        GVAR(currentItems) set [17,_items];
    };
};

// Update progress bar status, weight info
private _loadIndicatorBarCtrl = _display displayCtrl IDC_loadIndicatorBar;
_loadIndicatorBarCtrl progressSetPosition _load;

private _value = {_x == _item} count _items;
_ctrlList lnbSetText [[_lnbCurSel, 2],str _value];

[QGVAR(cargoChanged), [_display, _item, _addOrRemove, GVAR(shiftState)]] call CBA_fnc_localEvent;

[_ctrlList, _maxLoad] call FUNC(updateRightPanel);
