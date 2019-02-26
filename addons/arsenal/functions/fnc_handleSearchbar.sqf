#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles keyboard inputs inside the searchbars text boxes.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

private _textString = ctrlText _control;

if ((ctrlIDC _control) == IDC_rightSearchbar) then {
    if !(GVAR(lastSearchTextRight) isEqualTo "" || {(_textString find GVAR(lastSearchTextRight)) == 0}) then {//don't refill if there is no need
        [_display, _display displayCtrl GVAR(currentRightPanel)] call FUNC(fillRightPanel);
    };
    GVAR(lastSearchTextRight) = _textString;
    if (count _textString == 0) exitWith {};

    private _rightPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon];
    private _rightPanelCtrl = [_display displayCtrl IDC_rightTabContentListnBox, _display displayCtrl IDC_rightTabContent] select (_rightPanelState);

    if (_rightPanelState) then {

        private _itemsToGo = lbSize _rightPanelCtrl;
        private _lbIndex = 0;
        while {_itemsToGo > 0} do {
            private _currentData = _rightPanelCtrl lbText _lbIndex;
            private _currentClassname = _rightPanelCtrl lbData _lbIndex;

            if ((_currentData isEqualTo "") || {(((toUpper _currentData) find (toUpper _textString)) == -1) && {((toUpper _currentClassname) find (toUpper _textString)) == -1}}) then {
                _rightPanelCtrl lbDelete _lbIndex;
            } else {
                _lbIndex = _lbIndex + 1;
            };
            _itemsToGo = _itemsToGo - 1;
        };
        _rightPanelCtrl lbSetCurSel -1;
    } else {

        private _itemsToGo = (lnbSize _rightPanelCtrl) select 0;
        private _lbIndex = 0;
        while {_itemsToGo > 0} do {
            private _currentData = _rightPanelCtrl lnbText [_lbIndex, 1];
            private _currentClassname = _rightPanelCtrl lnbData [_lbIndex, 0];

            if ((_currentData isEqualTo "") || {(((toUpper _currentData) find (toUpper _textString)) == -1) && {((toUpper _currentClassname) find (toUpper _textString)) == -1}}) then {
                _rightPanelCtrl lnbDeleteRow _lbIndex;
            } else {
                _lbIndex = _lbIndex + 1;
            };
            _itemsToGo = _itemsToGo - 1;
        };
        _rightPanelCtrl lnbSetCurSelRow -1;
    };

    [_display, nil, nil, configNull] call FUNC(itemInfo);
} else {

    if !(GVAR(lastSearchTextLeft) isEqualTo "" || {(_textString find GVAR(lastSearchTextLeft)) == 0}) then {//don't refill if there is no need
        [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
    };
    GVAR(lastSearchTextLeft) = _textString;
    if (count _textString == 0) exitWith {};

    private _leftPanelCtrl = _display displayCtrl IDC_leftTabContent;


    private _itemsToGo = (lbSize _leftPanelCtrl);
    private _lbIndex = 0;
    while {_itemsToGo > 0} do {
        private _currentData = _leftPanelCtrl lbText _lbIndex;
        private _currentClassname = _leftPanelCtrl lbData _lbIndex;

        if ((_currentData isEqualTo "") || {(((toUpper _currentData) find (toUpper _textString)) == -1) && {((toUpper _currentClassname) find (toUpper _textString)) == -1}}) then {
            _leftPanelCtrl lbDelete _lbIndex;
        } else {
            _lbIndex = _lbIndex + 1;
        };
        _itemsToGo = _itemsToGo - 1;
    };
    _leftPanelCtrl lbSetCurSel -1;
    [_display, nil, nil, configNull] call FUNC(itemInfo);
};
