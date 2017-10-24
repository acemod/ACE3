#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

systemChat str [_display, _control];

if !(ctrlEnabled _control || {GVAR(currentLoadoutsTab) == ctrlIDC _control}) exitWith {};

private _centerBoxTitleCtrl = _display displayCtrl IDC_centerTitle;
private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;

switch (ctrlIDC _control) do {
    case IDC_buttonMyLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "My loadouts"; // TBL
    };

    case IDC_buttonDefaultLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Default loadouts"; // TBL
    };

    case IDC_buttonSharedLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Shared loadouts"; // TBL
    };
};

{
    _x ctrlEnable false;
    _x ctrlCommit 0;
} foreach [_shareButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl];

[_display, _control] call FUNC(fillLoadoutsList);

GVAR(currentLoadoutsTab) = ctrlIDC _control;
