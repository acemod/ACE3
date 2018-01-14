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

if (GVAR(showStats)) then {
    GVAR(showStats) = false;
    _buttonCtrl ctrlSetText ">";
    _statsCtrlGroupCtrl ctrlShow false;
} else {
    GVAR(showStats) = true;
    _buttonCtrl ctrlSetText "<";
    _statsCtrlGroupCtrl ctrlShow true;
};

