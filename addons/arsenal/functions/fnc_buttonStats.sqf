/*
 * Author: Alganthe
 * Toggle the stats control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

private _statsCtrlGroupCtrl = _display displayCtrl IDC_statsBox;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

private _statsButtonCtrl = _display displayCtrl IDC_statsButton;
private _statsButtonCloseCtrl = _display displayCtrl IDC_statsButtonClose;


_statsButtonCtrl ctrlShow GVAR(showStats);

GVAR(showStats) = !GVAR(showStats);

{
    _x ctrlShow GVAR(showStats);
} foreach [
    _statsCtrlGroupCtrl,
    _statsPreviousPageCtrl,
    _statsNextPageCtrl,
    _statsCurrentPageCtrl,
    _statsButtonCloseCtrl
];