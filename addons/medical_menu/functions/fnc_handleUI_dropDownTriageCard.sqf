/*
 * Author: Glowbal
 * Handle the triage card display
 *
 * Arguments:
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display","_pos","_ctrl","_curPos","_idc"];
disableSerialization;
_display = uiNamespace getVariable QGVAR(medicalMenu);
_pos = [ 0,0,0,0];
_curPos = ctrlPosition (_display displayCtrl 2002);
if ((_curPos select 0) == 0 && (_curPos select 1) == 0) then {
    _pos = ctrlPosition (_display displayCtrl 2001);
};

for "_idc" from 2002 to 2006 step 1 do {
    _pos set [1, (_pos select 1) + (_pos select 3)];
    _ctrl = (_display displayCtrl _idc);
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};

