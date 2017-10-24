#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control", "_curSel"];

if (_curSel == -1) exitWith {};

private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;

switch (GVAR(currentLoadoutsTab)) do {

    case IDC_buttonMyLoadouts: {

        _loadButtonCtrl ctrlEnable ([false, true] select ((_control lbValue _curSel) >= 0));
        _loadButtonCtrl ctrlCommit 0;

        _shareButtonCtrl ctrlEnable ([false, true] select (GVAR(allowSharedLoadouts)));
        _shareButtonCtrl ctrlCommit 0;

        _deleteButtonCtrl ctrlEnable (_curSel >= 0);
        _deleteButtonCtrl ctrlCommit 0;

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };

    case IDC_buttonDefaultLoadouts: {


        _loadButtonCtrl ctrlEnable ([false, true] select ((_control lbValue _curSel) >= 0));
        _loadButtonCtrl ctrlCommit 0;

        {
            _x ctrlEnable false;
            _x ctrlCommit 0;
        } foreach [_shareButtonCtrl, _deleteButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 0]);
    };

    case IDC_buttonSharedLoadouts: {

        _loadButtonCtrl ctrlEnable ([false, true] select ((_control lbValue _curSel) >= 0));
        _loadButtonCtrl ctrlCommit 0;

        {
            _x ctrlEnable false;
            _x ctrlCommit 0;
        } foreach [_shareButtonCtrl, _deleteButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 0]);
    };
};