#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * onLoad EH for arsenal loadouts display.
 *
 * Arguments:
 * 0: Ignored
 * 1: Arguments <ARRAY>
  * 1.1: Loadouts display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["_display"];

private _arsenalDisplay = findDisplay IDD_ace_arsenal;
private _mouseBlockCtrl = _arsenalDisplay displayCtrl IDC_mouseBlock;

_mouseBlockCtrl ctrlEnable true;
_mouseBlockCtrl ctrlCommit 0;

[_arsenalDisplay] call FUNC(buttonHide);

GVAR(currentLoadoutsTab) = -1;
GVAR(loadoutsSearchbarFocus) = false;
GVAR(loadoutsPanelFocus) =  false;

private _panelContentCtrl = _display displayCtrl IDC_contentPanel;
_panelContentCtrl ctrlSetFontHeight (4.5 * GRID_H);
_panelContentCtrl ctrlCommit 0;

if !(GVAR(allowDefaultLoadouts)) then {
    private _buttonDefaultLoadoutsCtrl = _display displayCtrl IDC_buttonDefaultLoadouts;
    _buttonDefaultLoadoutsCtrl ctrlEnable false;
    _buttonDefaultLoadoutsCtrl ctrlCommit 0;

    private _buttonDefaultLoadoutsBackgroundCtrl = _display displayCtrl IDC_buttonDefaultLoadoutsBackground;
    _buttonDefaultLoadoutsBackgroundCtrl ctrlShow false;
    _buttonDefaultLoadoutsBackgroundCtrl ctrlCommit 0;
};

if !(GVAR(allowSharedLoadouts) && {isMultiplayer}) then {
    private _buttonShareLoadoutsCtrl = _display displayCtrl IDC_buttonSharedLoadouts;
    _buttonShareLoadoutsCtrl ctrlEnable false;
    _buttonShareLoadoutsCtrl ctrlCommit 0;

    private _buttonShareLoadoutsBackgroundCtrl = _display displayCtrl IDC_buttonSharedLoadoutsBackground;
    _buttonShareLoadoutsBackgroundCtrl ctrlShow false;
    _buttonShareLoadoutsBackgroundCtrl ctrlCommit 0;
};

[QGVAR(loadoutsDisplayOpened), [_display]] call CBA_fnc_localEvent;

[_display, _display displayCtrl IDC_buttonMyLoadouts] call FUNC(loadoutsChangeTab);
