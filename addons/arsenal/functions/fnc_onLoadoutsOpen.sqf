#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["_display"];

private _arsenalDisplay = findDisplay IDD_ace_arsenal;
private _mouseBlockCtrl = _arsenalDisplay displayCtrl IDC_mouseBlock;

_mouseBlockCtrl ctrlEnable true;
_mouseBlockCtrl ctrlCommit 0;

[_arsenalDisplay] call FUNC(buttonHide);

GVAR(currentLoadoutsTab) = -1;

private _panelContentCtrl = _display displayCtrl IDC_contentPanel;
_panelContentCtrl ctrlSetFontHeight (GVAR(fontHeight) * GRID_H);
_panelContentCtrl ctrlCommit 0;

if !(GVAR(allowDefaultLoadouts)) then {
    private _buttonDefaultLoadoutsCtrl = _display displayCtrl IDC_buttonDefaultLoadouts;
    _buttonDefaultLoadoutsCtrl ctrlEnable false;
    _buttonDefaultLoadoutsCtrl ctrlCommit 0;
};

if !(GVAR(allowSharedLoadouts) && {isMultiplayer}) then {
    private _buttonShareLoadoutsCtrl = _display displayCtrl IDC_buttonSharedLoadouts;
    _buttonShareLoadoutsCtrl ctrlEnable false;
    _buttonShareLoadoutsCtrl ctrlCommit 0;
};

[_display, _display displayCtrl IDC_buttonMyLoadouts] call FUNC(loadoutsChangeTab);