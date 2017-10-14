#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _textString = ctrlText _control;

if ((ctrlIDC _control) == IDC_rightSearchbar) then {
    [_display, _display displayCtrl GVAR(currentRightPanel)] call FUNC(fillRightPanel);

    if (count _textString == 0) exitWith {};

    private _rightPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon];
    private _rightPanelCtrl = [_display displayCtrl IDC_rightTabContentListnBox, _display displayCtrl IDC_rightTabContent] select (_rightPanelState);

    if (_rightPanelState) then {

        private _indexTested = 0;
        while {_indexTested != lbSize _rightPanelCtrl -1} do {
            for "_lbIndex" from 0 to (lbSize _rightPanelCtrl) -1 do {

                private _currentData = _rightPanelCtrl lbText _lbIndex;

                if ((_currentData isEqualTo "") || {((toUpper _currentData) find (toUpper _textString)) == -1}) then {
                    _rightPanelCtrl lbDelete _lbIndex;
                };
            };
            _indexTested = _indexTested + 1;
        };
        _rightPanelCtrl lbSetCurSel -1;
    } else {

        private _indexTested = 0;
        while {_indexTested != ((lnbSize _rightPanelCtrl) select 0) -1} do {
            for "_lbIndex" from 0 to ((lnbSize _rightPanelCtrl) select 0) -1 do {

                private _currentData = _rightPanelCtrl lnbText [_lbIndex, 1];

                if ((_currentData isEqualTo "") || {((toUpper _currentData) find (toUpper _textString)) == -1}) then {
                    _rightPanelCtrl lnbDeleteRow _lbIndex;
                };
            };
            _indexTested = _indexTested + 1;
        };
        _rightPanelCtrl lnbSetCurSelRow -1;
    };

    [_display, nil, nil, (configFile >> "")] call FUNC(itemInfo);
} else {

    [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
    if (count _textString == 0) exitWith {};

    private _leftPanelCtrl = _display displayCtrl IDC_leftTabContent;

    private _indexTested = 0;
    while {_indexTested != lbSize _leftPanelCtrl -1} do {
        for "_lbIndex" from 0 to (lbSize _leftPanelCtrl) - 1 do {

            private _currentData = _leftPanelCtrl lbText _lbIndex;

            if ((_currentData isEqualTo "") || {((toUpper _currentData) find (toUpper _textString)) == -1}) then {
                _leftPanelCtrl lbDelete _lbIndex;
            };
        };
        _indexTested = _indexTested + 1;
    };
    _leftPanelCtrl lbSetCurSel -1;
    [_display, nil, nil, (configFile >> "")] call FUNC(itemInfo);
};

