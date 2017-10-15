#include "script_component.hpp"
#include "..\defines.hpp"

params ["_control", "_mode"];

private _display = ctrlParent _control;

private ["_panel", "_curSel", "_selected"];

TRACE_2("sortPanel", _control, _mode);

if (ctrlIDC _control == 17 && {GVAR(currentLeftPanel) in [IDC_buttonUniform ,IDC_buttonVest, IDC_buttonBackpack]}) then {
    _panel = _display displayCtrl IDC_rightTabContentListnBox;
    _curSel = lbCurSel _panel;
    _selected = _panel lbData _curSel;

    if (_mode > 0) then {
       _panel lnbSortByValue [0, false];
    } else {
       _panel lnbSort [1, false];
    };

    if (_cursel >= 0) then {
        for '_i' from 0 to (lbsize _panel - 1) do {
            if ((_panel lbdata _i) == _selected) exitwith {_panel lbSetCurSel _i};
        };
    };

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


