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
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control || {GVAR(currentLoadoutsTab) == ctrlIDC _control}) exitWith {};

private _centerBoxTitleCtrl = _display displayCtrl IDC_centerTitle;
private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;

switch (ctrlIDC _control) do {
    case IDC_buttonMyLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "My loadouts"; // TBL

        _saveButtonCtrl ctrlEnable true;
        _saveButtonCtrl ctrlCommit 0;
    };

    case IDC_buttonDefaultLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Default loadouts"; // TBL

        _saveButtonCtrl ctrlEnable (is3DEN);
        _saveButtonCtrl ctrlCommit 0;
    };

    case IDC_buttonSharedLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Shared loadouts"; // TBL

        _saveButtonCtrl ctrlEnable false;
        _saveButtonCtrl ctrlCommit 0;
    };
};

{
    _x ctrlEnable false;
    _x ctrlCommit 0;
} foreach [_shareButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl, _renameButtonCtrl];

GVAR(currentLoadoutsTab) = ctrlIDC _control;

[_display, _control] call FUNC(fillLoadoutsList);
