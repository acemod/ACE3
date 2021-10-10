#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles selection changes on the right panel (listnbox).
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Right panel selection <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

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

if (GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) then {

    [
        _item, 
        ["CfgWeapons", "CfgMagazines"] select (GVAR(currentRightPanel) in [IDC_buttonMag, IDC_buttonMagALL, IDC_buttonThrow, IDC_buttonPut])
    ] call _fnc_selectRight;
};
