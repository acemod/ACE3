#include "..\script_component.hpp"
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
    // Local loadouts
    case IDC_buttonMyLoadouts: {
        _centerBoxTitleCtrl ctrlSetText LLSTRING(tabMyLoadoutsText);

        if (call FUNC(canEditDefaultLoadout)) then {
            _saveButtonCtrl ctrlSetTooltip format ["%1\n%2", LLSTRING(buttonSaveTooltip), LLSTRING(buttonSaveTooltip_shiftClick)];
        };

        _saveButtonCtrl ctrlEnable true;
        _saveButtonCtrl ctrlCommit 0;
    };
    // Default loadouts
    case IDC_buttonDefaultLoadouts: {
        _centerBoxTitleCtrl ctrlSetText LLSTRING(tabDefaultLoadoutsText);

        if (call FUNC(canEditDefaultLoadout)) then {
            _saveButtonCtrl ctrlSetTooltip LLSTRING(buttonSaveTooltip);
        };

        _renameButtonCtrl ctrlEnable is3DEN; // no renaming mid-mission
        _saveButtonCtrl ctrlEnable call FUNC(canEditDefaultLoadout);
        _saveButtonCtrl ctrlCommit 0;
    };
    // Shared loadouts
    case IDC_buttonSharedLoadouts: {
        _centerBoxTitleCtrl ctrlSetText LLSTRING(tabSharedLoadoutsText);

        if (call FUNC(canEditDefaultLoadout)) then {
            _saveButtonCtrl ctrlSetTooltip LLSTRING(buttonSaveTooltip);
        };

        _saveButtonCtrl ctrlEnable false;
        _saveButtonCtrl ctrlCommit 0;
    };
};

{
    _x ctrlEnable false;
    _x ctrlCommit 0;
} forEach [_shareButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl, _renameButtonCtrl];

// Save new tab as current tab
GVAR(currentLoadoutsTab) = ctrlIDC _control;

[QGVAR(loadoutsTabChanged), [_display, _control]] call CBA_fnc_localEvent;

[_display, _control] call FUNC(fillLoadoutsList);
