/*
 * Author: Glowbal
 * Display triage card for a unit
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_show", "_ctrl", "_display", "_idc", "_pos"];
_show = _this select 0;
disableSerialization;

_display = uiNamespace getvariable QGVAR(triageCard);
if (isnil "_display") exitwith {};

_pos = [0,0,0,0];
if (_show) then {
    _pos = ctrlPosition (_display displayCtrl 2001);
};
for "_idc" from 2002 to 2006 step 1 do {
    _pos set [1, (_pos select 1) + (_pos select 3)];
    _ctrl = (_display displayCtrl _idc);
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};
