#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Update the right panel (listnbox).
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Container <OBJECT>
 * 2: If container has items <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_container", "_hasItems"];

private _loadRemaining = maxLoad _container - loadAbs _container;

private _item = "";
private _color = [];
private _alpha = 1;

// Grey out items that are too big to fit in remaining space of the container
for "_row" from 0 to (lnbSize _control select 0) - 1 do {
    _item = _control lnbData [_row, 0];
    _color = _control lnbColor [_row, 1];

    // Lower alpha on color for items that can't fit
    _alpha = [0.25, 1] select (_container canAdd _item);
    _color set [3, _alpha];
    _control lnbSetColor [[_row, 1], _color];
    _control lnbSetColor [[_row, 2], [1, 1, 1, _alpha]];
};

private _display = ctrlParent _control;

// If there are items inside container, show "remove all" button
private _removeAllCtrl = _display displayCtrl IDC_buttonRemoveAll;

// A separate "_hasItems" argument is needed, because items can have no mass
_removeAllCtrl ctrlSetFade 0;
_removeAllCtrl ctrlShow _hasItems;
_removeAllCtrl ctrlEnable _hasItems;
_removeAllCtrl ctrlCommit FADE_DELAY;

// Update weight display
(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", GVAR(center) call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);

private _curSel = lnbCurSelRow _control;

// Disable '+' button if item is unique or too big to fit in remaining space
if (_curSel != -1) then {
    private _plusButtonCtrl = _display displayCtrl IDC_arrowPlus;
    _plusButtonCtrl ctrlEnable ((_control lnbValue [_curSel, 2]) != 1 && {_container canAdd (_control lnbData [_curSel, 0])});
    _plusButtonCtrl ctrlCommit FADE_DELAY;
};
