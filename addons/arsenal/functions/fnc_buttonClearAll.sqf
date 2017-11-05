/*
 * Author: Alganthe
 * Clear the current container.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

// Clear container
switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonUniform: {
        {GVAR(center) removeItemFromUniform _x} foreach (uniformItems GVAR(center));
        GVAR(currentItems) set [15, []];
    };
    case IDC_buttonVest: {
        {GVAR(center) removeItemFromVest _x} foreach (vestItems GVAR(center));
        GVAR(currentItems) set [16, []];
    };
    case IDC_buttonBackpack: {
        {GVAR(center) removeItemFromBackpack _x} foreach (backpackItems GVAR(center));
        GVAR(currentItems) set [17, []];
    };
};

// Clear number of owned items
private _ctrlList = _display displayCtrl IDC_rightTabContentListnBox;

for "_l" from 0 to (lbSize _ctrlList - 1) do {
    _ctrlList lnbSetText [[_l, 2], str 0];
};

private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;
_removeAllCtrl ctrlSetFade 1;
_removeAllCtrl ctrlCommit FADE_DELAY;

// Update load bar
private _loadIndicatorBarCtrl = _display displayCtrl IDC_loadIndicatorBar;
_loadIndicatorBarCtrl progressSetPosition 0;

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

private _control = _display displayCtrl IDC_rightTabContentListnBox;
[_control, _maxLoad] call FUNC(updateRightPanel);
