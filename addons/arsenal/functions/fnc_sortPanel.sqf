#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, Dedmen
 * Sort arsenal panel.
 *
 * Arguments:
 * 0: Panel's control to sort <CONTROL>
 * 1: Sorting mode <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_mode"];

private _display = ctrlParent _control;
private ["_panel", "_curSel", "_selected"];

// Right panel
if (ctrlIDC _control == 17 && {GVAR(currentLeftPanel) in [IDC_buttonUniform ,IDC_buttonVest, IDC_buttonBackpack]}) then {
    _panel = _display displayCtrl IDC_rightTabContentListnBox;
    _curSel = lnbCurSelRow _panel;
    _selected = _panel lnbData [_curSel, 0];

    switch (_mode) do {
        case 0: {
            _panel lnbSort [1, false];
        };

        case 1: {
            _panel lnbSortByValue [0, false];
        };

        case 2: {
            for "_i" from 0 to (((lnbsize _panel) select 0) - 1) do {
                _panel lnbSetText [[_i, 2], str (parseNumber (_panel lnbText [_i, 2]) / 1000)];
            };

            _panel lnbSort [2, true];


            for "_i" from 0 to (((lnbsize _panel) select 0) - 1) do {
                _panel lnbSetText [[_i, 2], str (parseNumber (_panel lnbText [_i, 2]) * 1000)];
            };
        };
    };

    if (_cursel >= 0) then {
        for '_i' from 0 to (((lnbsize _panel) select 0) - 1) do {
            if ((_panel lnbdata [_i, 0]) == _selected) exitwith {_panel lnbSetCurSelRow _i};
        };
    };
// Left panel
} else {
    _panel = _display displayCtrl ([IDC_leftTabContent, IDC_rightTabContent] select (ctrlIDC _control == 17));
    _curSel = lbCurSel _panel;
    _selected = _panel lbData _curSel;

    if (_mode > 0) then {
        lbSortByValue _panel;
    } else {
        lbsort _panel;
    };

    if (_cursel >= 0) then {
        for '_i' from 0 to (lbsize _panel - 1) do {
            if ((_panel lbdata _i) == _selected) exitwith {_panel lbSetCurSel _i};
        };
    };
};
