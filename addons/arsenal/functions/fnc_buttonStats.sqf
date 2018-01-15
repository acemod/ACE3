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

params ["_display", "_buttonCtrl"];

private _statsCtrlGroupCtrl = _display displayCtrl IDC_statsBox;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

if (GVAR(showStats)) then {
    GVAR(showStats) = false;
    _buttonCtrl ctrlSetText ">";

    {
        _x ctrlShow false;
    } foreach [
        _statsCtrlGroupCtrl,
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl
    ];

} else {
    GVAR(showStats) = true;
    _buttonCtrl ctrlSetText "<";
    
    {
        _x ctrlShow true;
    } foreach [
        _statsCtrlGroupCtrl,
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl
    ];
};
