#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);

private _fnc_selectRight = {
    params ["_item", "_currentItemIndex", "_cfgEntry"];

    [_display, _control, _curSel, (configFile >> _cfgEntry >> _item)] call FUNC(itemInfo);
};

switch (GVAR(currentRightPanel)) do {

    case IDC_buttonOptic;
    case IDC_buttonItemAcc;
    case IDC_buttonMuzzle;
    case IDC_buttonBipod : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform : {
                [_item, 15 ,"CfgWeapons"] call _fnc_selectRight;
            };
            case IDC_buttonVest : {
                [_item, 16 ,"CfgWeapons"] call _fnc_selectRight;
            };
            case IDC_buttonBackpack : {
                [_item, 17 ,"CfgWeapons"] call _fnc_selectRight;
            };
        };
    };

    case IDC_buttonMag;
    case IDC_buttonMagALL;
    case IDC_buttonThrow;
    case IDC_buttonPut : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform : {
                [_item, 15 ,"CfgMagazines"] call _fnc_selectRight;
            };
            case IDC_buttonVest : {
                [_item, 16 ,"CfgMagazines"] call _fnc_selectRight;
            };
            case IDC_buttonBackpack : {
                [_item, 17 ,"CfgMagazines"] call _fnc_selectRight;
            };
        };
    };

    case IDC_buttonMisc : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform : {
                [_item, 15 ,"CfgWeapons"] call _fnc_selectRight;
            };
            case IDC_buttonVest : {
                [_item, 16 ,"CfgWeapons"] call _fnc_selectRight;
            };
            case IDC_buttonBackpack : {
                [_item, 17 ,"CfgWeapons"] call _fnc_selectRight;
            };
        };
    };
};