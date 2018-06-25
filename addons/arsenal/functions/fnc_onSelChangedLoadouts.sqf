#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles selection changes on loadouts panel.
 *
 * Arguments:
 * 0: Loadouts panel control <CONTROL>
 * 1: Loadouts panel selection <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel"];

private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;

if (_curSel == -1) exitWith {

    if (GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts) then {
        _saveButtonCtrl ctrlEnable false;
        _saveButtonCtrl ctrlCommit 0;
    };

    _shareButtonCtrl ctrlSetText (localize LSTRING(buttonSharePrivateText));

    {
        _x ctrlEnable false;
        _x ctrlCommit 0;
    } foreach [_shareButtonCtrl, _loadButtonCtrl, _deleteButtonCtrl, _renameButtonCtrl];
};

switch (GVAR(currentLoadoutsTab)) do {

    case IDC_buttonMyLoadouts: {

        _shareButtonCtrl ctrlEnable (GVAR(allowSharedLoadouts) && {isMultiplayer});
        _shareButtonCtrl ctrlCommit 0;

        _loadButtonCtrl ctrlEnable true;
        _loadButtonCtrl ctrlCommit 0;

        _shareButtonCtrl ctrlSetText ( [
            localize LSTRING(buttonSharePrivateText),
            localize LSTRING(buttonSharePublicText)
        ] select ((_control lnbValue [_curSel, 0]) == 1));

        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } foreach [_renameButtonCtrl, _deleteButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };

    case IDC_buttonDefaultLoadouts: {

        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } foreach [_saveButtonCtrl, _loadButtonCtrl];

        _shareButtonCtrl ctrlEnable false;
        _shareButtonCtrl ctrlCommit 0;

        {
            _x ctrlEnable (is3DEN);
            _x ctrlCommit 0;
        } foreach [_deleteButtonCtrl, _renameButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };

    case IDC_buttonSharedLoadouts: {

        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } foreach [_saveButtonCtrl, _loadButtonCtrl];

        _shareButtonCtrl ctrlEnable false;
        _shareButtonCtrl ctrlCommit 0;

        if ((serverCommandAvailable "#logout") || {(_control lnbText [_curSel, 0]) == profileName}) then {

            _deleteButtonCtrl ctrlEnable true;
            _deleteButtonCtrl ctrlCommit 0;
        } else {
            _deleteButtonCtrl ctrlEnable false;
            _deleteButtonCtrl ctrlCommit 0;
        };

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };
};
