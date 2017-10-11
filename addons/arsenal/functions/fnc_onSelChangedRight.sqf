#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);


private _fnc_selectItem = {
     params ["_item", "_currentItemsIndex", "_itemIndex"];

     LOG("called");
    switch (_currentItemsIndex) do {

        case 18: {
            if (_item == "") then {
                GVAR(center) removePrimaryWeaponItem ((GVAR(currentItems) select 18) select _itemIndex);
                GVAR(currentItems) set [18, primaryWeaponItems GVAR(center)];
            } else {
                GVAR(center) addPrimaryWeaponItem _item;
                GVAR(currentItems) set [18, primaryWeaponItems GVAR(center)];
            };
            [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
        };

        case 19: {
            if (_item == "") then {
                GVAR(center) removeSecondaryWeaponItem ((GVAR(currentItems) select 19) select _itemIndex);
                GVAR(currentItems) set [19, secondaryWeaponItems GVAR(center)];
            } else {
                GVAR(center) addSecondaryWeaponItem _item;
                GVAR(currentItems) set [18, secondaryWeaponItems GVAR(center)];
            };
            [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
        };

        case 20: {
            if (_item == "") then {
                GVAR(center) removeHandgunItem((GVAR(currentItems) select 20) select _itemIndex);
                GVAR(currentItems) set [20, handgunItems GVAR(center)];
            } else {
                GVAR(center) addHandgunItem _item;
                GVAR(currentItems) set [18, handgunItems GVAR(center)];
            };
            [_display, _control, _curSel, (configFile >> "CfgWeapons" >> _item)] call FUNC(itemInfo);
        };
    };
};

switch (GVAR(currentRightPanel)) do {

    case IDC_buttonOptic : {
        switch (GVAR(CurrentLeftPanel)) do { 
            case  IDC_buttonPrimaryWeapon : {
                [_item, 18, 2] call _fnc_selectItem;
            };
            case IDC_buttonSecondaryWeapon : {
                [_item, 19, 2] call _fnc_selectItem;
            };
            case IDC_buttonHandgun : {
                [_item, 20, 2] call _fnc_selectItem;
            };
        };
    };

    case IDC_buttonItemAcc : {
        switch (GVAR(CurrentLeftPanel)) do { 
            case  IDC_buttonPrimaryWeapon : {
                [_item, 18, 1] call _fnc_selectItem;
            };
            case IDC_buttonSecondaryWeapon : {
                [_item, 19, 1] call _fnc_selectItem;
            };
            case IDC_buttonHandgun : {
                [_item, 20, 1] call _fnc_selectItem;
            };
        };
    };

    case IDC_buttonMuzzle : {
        switch (GVAR(CurrentLeftPanel)) do { 
            case  IDC_buttonPrimaryWeapon : {
                [_item, 18, 0] call _fnc_selectItem;
            };
            case IDC_buttonSecondaryWeapon : {
                [_item, 19, 0] call _fnc_selectItem;
            };
            case IDC_buttonHandgun : {
                [_item, 20, 0] call _fnc_selectItem;
            };
        };
    };

    case IDC_buttonBipod : {
        switch (GVAR(CurrentLeftPanel)) do { 
            case  IDC_buttonPrimaryWeapon : {
                [_item, 18, 3] call _fnc_selectItem;
            };
            case IDC_buttonSecondaryWeapon : {
                [_item, 19, 3] call _fnc_selectItem;
            };
            case IDC_buttonHandgun : {
                [_item, 20, 3] call _fnc_selectItem;
            };
        };
    };
};