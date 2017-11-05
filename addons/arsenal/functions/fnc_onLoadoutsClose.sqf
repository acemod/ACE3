/*
 * Author: Alganthe
 * onUnLoad EH for ACE3's arsenal loadouts display
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["", "_args"];
_args params ["_display"];

GVAR(currentLoadoutsTab) = nil;

private _arsenalDisplay = findDisplay IDD_ace_arsenal;
private _mouseBlockCtrl = _arsenalDisplay displayCtrl IDC_mouseBlock;

_mouseBlockCtrl ctrlEnable false;
_mouseBlockCtrl ctrlCommit 0;

[_arsenalDisplay] call FUNC(buttonHide);

[_arsenalDisplay , _arsenalDisplay displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
