#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Handles the actions control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <NUMBER>
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
private _actionsBoxCtrl = _display displayCtrl IDC_actionsBox;
_actionsBoxCtrl ctrlShow _show;
_actionsBoxCtrl ctrlCommit FADE_DELAY;

if (!_show) exitWith {};

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
_actionsCurrentPageCtrl ctrlShow true;
_actionsCurrentPageCtrl ctrlCommit 0;

private _activeCtrls = [];
{
    _x params ["", "_type", "_label", "_statement"];

    private _idc = IDC_actionsText1 + _type + _forEachIndex * 2;
    private _actionCtrl = _display displayCtrl _idc;

    switch (_type) do {
        case ACTION_TYPE_BUTTON: {
            _actionCtrl ctrlRemoveAllEventHandlers "ButtonClick";
            _actionCtrl ctrlAddEventHandler ["ButtonClick", {
                if (is3DEN) exitWith {[true] call FUNC(refresh)};
                [{
                    [true] call FUNC(refresh);
                }] call CBA_fnc_execNextFrame;
            }];

            _actionCtrl ctrlAddEventHandler ["ButtonClick", _statement];
            _actionCtrl ctrlSetText _label;
            _actionCtrl ctrlEnable true;
        };
        case ACTION_TYPE_TEXT: {
            private _text = call _statement;

            if (isNil "_text") then {
                _text = "";
            };
            if (_text isEqualType []) then {
                _text = _text joinString endl;
            };

            _actionCtrl ctrlSetText _text;
            _actionCtrl ctrlSetPositionH (ctrlTextHeight _actionCtrl);
            _actionCtrl ctrlEnable false;
        };
    };

    if (_activeCtrls isNotEqualTo []) then {
        (ctrlPosition (_activeCtrls select -1)) params ["", "_lastPosY", "", "_lastPosH"];
        _actionCtrl ctrlSetPositionY (_lastPosY + _lastPosH + GRID_H);
    } else {
        _actionCtrl ctrlSetPositionY ((5 + _type) * GRID_H);
    };

    _actionCtrl ctrlShow true;
    _actionCtrl ctrlCommit 0;
    _activeCtrls pushBack _actionCtrl;
} forEach _items;

{
    private _idc = ctrlIDC _x;
    if (_idc < IDC_actionsText1 || _idc > IDC_actionsButton5) then {continue};

    _x ctrlShow false;
    _x ctrlEnable false;
    _x ctrlSetPositionY 0;
    _x ctrlCommit 0;
} forEach ((allControls _actionsBoxCtrl) select {!(_x in _activeCtrls)});

(ctrlPosition (_activeCtrls select -1)) params ["", "_lastPosY", "", "_lastPosH"];
private _actionsBoxHeight = _lastPosY + _lastPosH + GRID_H;
_actionsBoxCtrl ctrlSetPositionH _actionsBoxHeight;
_actionsBoxCtrl ctrlCommit 0;

private _background = _display displayCtrl IDC_actionsBackground1;
_background ctrlSetPositionH _actionsBoxHeight;
_background ctrlCommit 0;
