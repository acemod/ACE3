#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

systemChat str [_display, _control];

if !(ctrlEnabled _control) exitWith {};

private _centerBoxTitleCtrl = _display displayCtrl IDC_centerTitle;
private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _saveAsButtonCtrl = _display displayCtrl IDC_buttonSaveAs;

switch (ctrlIDC _control) do {

    case IDC_buttonMyLoadouts: {

        _centerBoxTitleCtrl ctrlSetText "My loadouts"; // TBL
        _shareButtonCtrl ctrlEnable ([false, true] select (GVAR(allowSharedLoadouts)));
        _saveButtonCtrl ctrlEnable true;

        _shareButtonCtrl ctrlCommit 0;
        _saveButtonCtrl ctrlCommit 0;

        // Call filling func
    };

    case IDC_buttonDefaultLoadouts: {

        _centerBoxTitleCtrl ctrlSetText "Default loadouts"; // TBL

        {
            _x ctrlEnable false;
            _x ctrlCommit 0;
        } foreach [_shareButtonCtrl, _saveButtonCtrl];

        // Call filling func
    };

    case IDC_buttonSharedLoadouts: {

        _centerBoxTitleCtrl ctrlSetText "Shared loadouts"; // TBL

        {
            _x ctrlEnable false;
            _x ctrlCommit 0;
        } foreach [_shareButtonCtrl, _saveButtonCtrl];

        // Call filling func
    };
};