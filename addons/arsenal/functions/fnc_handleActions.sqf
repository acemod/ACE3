#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Handles the actions control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <SCALAR>
 * 3: Item config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel", "_itemCfg"];

GVAR(actionsInfo) = [_control, _curSel, _itemCfg];

private _panel = [
    IDC_buttonPrimaryWeapon,
    IDC_buttonHandgun,
    IDC_buttonSecondaryWeapon,
    IDC_buttonUniform,
    IDC_buttonVest,
    IDC_buttonBackpack,
    IDC_buttonHeadgear,
    IDC_buttonGoggles,
    IDC_buttonNVG,
    IDC_buttonBinoculars,
    IDC_buttonMap,
    IDC_buttonGPS,
    IDC_buttonRadio,
    IDC_buttonCompass,
    IDC_buttonWatch,
    IDC_buttonFace,
    IDC_buttonVoice,
    IDC_buttonInsignia
] find GVAR(currentLeftPanel);

private _groups = (GVAR(actionList) select _panel) select {
    [GVAR(center)] call (_x select 2)
};

private _show = _groups isNotEqualTo [];
private _ctrl = _display displayCtrl IDC_actionsBox;
_ctrl ctrlShow _show;
_ctrl ctrlCommit 0.15;

if (!_show) exitWith {};

private _actionsBoxCtrl = _display displayCtrl IDC_actionsBox;
private _actionsCurrentPageCtrl = _display displayCtrl IDC_actionsCurrentPage;

private _currentPage = GVAR(currentActionPage);
private _pages = count _groups;

if (_currentPage < 0) then {
    _currentPage = _pages - 1;
};

if (_currentPage >= _pages) then {
    _currentPage = 0;
    GVAR(currentActionPage) = _currentPage;
};

{
    private _ctrl = _display displayCtrl _x;
    _ctrl ctrlShow (_pages > 1);
    _ctrl ctrlCommit 0;
} forEach [IDC_actionsPreviousPage, IDC_actionsNextPage];

private _group = _groups select _currentPage;
private _items = _group select 3 select {
    [GVAR(center)] call (_x select 4)
};

_actionsCurrentPageCtrl ctrlSetText (_group select 1);
_actionsCurrentPageCtrl ctrlSetFade 0;
_actionsCurrentPageCtrl ctrlShow true;
_actionsCurrentPageCtrl ctrlCommit 0;

{
    _x params ["", "_type", "_label", "_statement"];

    private _idc = 9001 + _forEachIndex * 2;
    private _actionTextCtrl = _display displayCtrl _idc;
    private _actionButtonCtrl = _display displayCtrl (_idc + 1);

    switch (_type) do {
        case ACTION_TYPE_BUTTON: {
            _actionButtonCtrl ctrlRemoveAllEventHandlers "ButtonClick";
            _actionButtonCtrl ctrlAddEventHandler ["ButtonClick", {
                if (is3DEN) exitWith {[true] call FUNC(refresh)};
                [{
                    [true] call FUNC(refresh);
                }] call CBA_fnc_execNextFrame;
            }];
            _actionButtonCtrl ctrlAddEventHandler ["ButtonClick", _statement];
            _actionButtonCtrl ctrlSetText _label;
            _actionButtonCtrl ctrlSetFade 0;
            _actionButtonCtrl ctrlEnable true;
            _actionButtonCtrl ctrlCommit 0;
            _actionTextCtrl ctrlSetFade 1;
            _actionTextCtrl ctrlCommit 0;
        };
        case ACTION_TYPE_TEXT: {
            private _text = call _statement;

            if (isNil "_text") then {
                _text = "";
            };

            _actionTextCtrl ctrlSetText _text;
            _actionTextCtrl ctrlSetFade 0;
            _actionTextCtrl ctrlCommit 0;
            _actionButtonCtrl ctrlSetFade 1;
            _actionButtonCtrl ctrlEnable false;
            _actionButtonCtrl ctrlCommit 0;
        };
        default {
            _actionTextCtrl ctrlSetFade 1;
            _actionTextCtrl ctrlCommit 0;
            _actionButtonCtrl ctrlSetFade 1;
            _actionButtonCtrl ctrlEnable false;
            _actionButtonCtrl ctrlCommit 0;
        };
    };
} forEach _items;

private _actionCount = count _items;

{
    private _idc = 9001 + _x * 2;
    private _actionTextCtrl = _display displayCtrl _idc;
    private _actionButtonCtrl = _display displayCtrl (_idc + 1);

    _actionTextCtrl ctrlSetFade 1;
    _actionTextCtrl ctrlCommit 0;
    _actionButtonCtrl ctrlSetFade 1;
    _actionButtonCtrl ctrlCommit 0;
} forEach ([0, 1, 2, 3, 4] select [_actionCount, 5]);

private _pos = ctrlPosition _actionsBoxCtrl;
_pos set [3, ([11, (5 * _actionCount) + 6] select (_actionCount > 0)) * GRID_H];
_actionsBoxCtrl ctrlSetPosition _pos;
_actionsBoxCtrl ctrlCommit 0;
