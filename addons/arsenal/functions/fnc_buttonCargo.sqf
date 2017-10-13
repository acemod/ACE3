#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_addOrRemove"];

private _load = 0;
private _items = [];
private _ctrlList = (_display displayCtrl IDC_rightTabContentListnBox);
private _lbCurSel = lbCurSel _ctrlList;
private _item = _ctrlList lnbData [_lbCurSel, 0];

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
    };
};

(_display displayCtrl IDC_loadIndicatorBar) progressSetPosition _load;

private _value = {_x == _item} count _items;
_ctrlList lnbSetText [[_lbCurSel, 2],str _value];