#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_addOrRemove"];

private _load = 0;
private _items = [];
private _ctrlList = (_display displayCtrl IDC_rightTabContentListnBox);
private _lnbCurSel = lnbCurSelRow _ctrlList;
private _item = _ctrlList lnbData [_lnbCurSel, 0];

if ((_ctrlList lnbValue [_lnbCurSel, 2]) == 1 && {_addOrRemove == 1}) exitWith {};

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
        _items = backpackItems GVAR(center);
        GVAR(currentItems) set [17,_items];
    };
};

(_display displayCtrl IDC_loadIndicatorBar) progressSetPosition _load;

private _value = {_x == _item} count _items;
_ctrlList lnbSetText [[_lnbCurSel, 2],str _value];