#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);

private _fnc_selectRight = {
    params ["_item", "_cfgEntry"];

    // Load remaining
    private _maxLoad = switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonUniform: {
            gettext (configfile >> "CfgWeapons" >> uniform GVAR(center) >> "ItemInfo" >> "containerClass")
        };
        case IDC_buttonVest: {
            gettext (configfile >> "CfgWeapons" >> vest GVAR(center) >> "ItemInfo" >> "containerClass")
        };
        case IDC_buttonBackpack: {
            backpack GVAR(center)
        };
    };

    [_control, _maxLoad] call FUNC(updateRightPanel);
    [_display, _control, _curSel, (configFile >> _cfgEntry >> _item)] call FUNC(itemInfo);
};

switch (GVAR(currentRightPanel)) do {

    case IDC_buttonOptic;
    case IDC_buttonItemAcc;
    case IDC_buttonMuzzle;
    case IDC_buttonBipod : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform;
            case IDC_buttonVest;
            case IDC_buttonBackpack : {
                [_item, "CfgWeapons"] call _fnc_selectRight;
            };
        };
    };

    case IDC_buttonMag;
    case IDC_buttonMagALL;
    case IDC_buttonThrow;
    case IDC_buttonPut : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform;
            case IDC_buttonVest;
            case IDC_buttonBackpack : {
                [_item, "CfgMagazines"] call _fnc_selectRight;
            };
        };
    };

    case IDC_buttonMisc : {
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonUniform;
            case IDC_buttonVest;
            case IDC_buttonBackpack : {
                [_item, "CfgWeapons"] call _fnc_selectRight;
            };
        };
    };
};
