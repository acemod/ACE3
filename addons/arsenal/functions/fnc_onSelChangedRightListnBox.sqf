#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _ctrlIDC = ctrlIDC _control;
private _display = ctrlParent _control;
private _item = [_control lnbData [_curSel, 0], _control lbData _curSel] select !(ctrlType _control == 102);

private _fnc_selectRight = {
    params ["_item", "_cfgEntry"];
    (lnbSize _control) params ["_rows", "_columns"];

    _columns = count lnbGetColumnsPosition _control;

    // Load remaining
    private _load = switch (GVAR(currentLeftPanel)) do {
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
    _load = getnumber (configfile >> "CfgVehicles" >> _load >> "maximumLoad");
    _load = _load * (1 - progressPosition (_display displayCtrl IDC_loadIndicatorBar));

    // Grey out items too big
    for "_r" from 0 to (_rows - 1) do {
        private _mass = _control lnbValue [_r, 0];
        private _alpha = [1.0,0.25] select (_mass > _load);
        private _color = [1,1,1,_alpha];
        _control lnbsetcolor [[_r,1],_color];
        _control lnbsetcolor [[_r,2],_color];
    };

    // Remove all from container show / hide
    private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;

    if (progressPosition (_display displayCtrl IDC_loadIndicatorBar) > 0) then {

        _removeAllCtrl ctrlSetFade 0;
        _removeAllCtrl ctrlShow true;
        _removeAllCtrl ctrlCommit FADE_DELAY;
    };

    // change button color if unique or too big
    private _plusButtonCtrl = _display displayCtrl IDC_arrowPlus;
    if ((_control lnbValue [_curSel, 2]) == 1 || {(_control lnbValue [_curSel, 0]) > _load}) then {
        _plusButtonCtrl ctrlEnable false;
        _plusButtonCtrl ctrlCommit FADE_DELAY;
    } else {
        _plusButtonCtrl ctrlEnable true;
        _plusButtonCtrl ctrlCommit FADE_DELAY;
    };

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

(_display displayCtrl IDC_totalWeightText) ctrlSetText (GVAR(center) call EFUNC(movement,getWeight)); // TBL