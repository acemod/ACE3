#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles tab changing for the loadouts display.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

if !(ctrlEnabled _control || {GVAR(currentLoadoutsTab) == ctrlIDC _control}) exitWith {};

private _centerBoxTitleCtrl = _display displayCtrl IDC_centerTitle;
private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;

// Update UI visual elements
if (GVAR(currentLoadoutsTab) != -1) then {

    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLoadoutsTab) - 1);
    _previousCtrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.8];
    _previousCtrlBackground ctrlCommit 0;

    private _previousCtrl = _display displayCtrl GVAR(currentLoadoutsTab);
    _previousCtrl ctrlSetTextColor [1, 1, 1, 1];
    _previousCtrl ctrlCommit 0;
};

private _ctrlBackground = _display displayCtrl ((ctrlIDC _control) - 1);
_ctrlBackground ctrlSetBackgroundColor [1, 1, 1, 0.8];
_ctrlBackground ctrlCommit 0;

_control ctrlSetTextColor [0, 0, 0, 1];
_control ctrlCommit 0;

switch (ctrlIDC _control) do {
    case IDC_buttonMyLoadouts: {
        _centerBoxTitleCtrl ctrlSetText (localize LSTRING(tabMyLoadoutsText));

        if (is3den) then { _saveButtonCtrl ctrlSetTooltip format ["%1\n%2", localize LSTRING(buttonSaveTooltip), localize LSTRING(buttonSaveTooltip_shiftClick)]; };
        _saveButtonCtrl ctrlEnable true;
        _saveButtonCtrl ctrlCommit 0;
    };

    case IDC_buttonDefaultLoadouts: {
        _centerBoxTitleCtrl ctrlSetText (localize LSTRING(tabDefaultLoadoutsText));

        if (is3den) then { _saveButtonCtrl ctrlSetTooltip localize LSTRING(buttonSaveTooltip); };
        _saveButtonCtrl ctrlEnable (is3DEN);
        _saveButtonCtrl ctrlCommit 0;
    };

    case IDC_buttonSharedLoadouts: {
        _centerBoxTitleCtrl ctrlSetText (localize LSTRING(tabSharedLoadoutsText));

        if (is3den) then { _saveButtonCtrl ctrlSetTooltip localize LSTRING(buttonSaveTooltip); };
        _saveButtonCtrl ctrlEnable false;
        _saveButtonCtrl ctrlCommit 0;
    };
};

{
    _x ctrlEnable false;
    _x ctrlCommit 0;
} foreach [_shareButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl, _renameButtonCtrl];

GVAR(currentLoadoutsTab) = ctrlIDC _control;

[QGVAR(loadoutsTabChanged), [_display, _control]] call CBA_fnc_localEvent;

[_display, _control] call FUNC(fillLoadoutsList);
