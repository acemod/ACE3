/*
 * Author: Glowbal
 * Display triage card for a unit
 *
 * Arguments:
 * 0: Show <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_medical_fnc_dropDownTriageCard
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_show"];

disableSerialization;
private _display = uiNamespace getVariable QGVAR(triageCard);
if (isNil "_display") exitWith {};

private _pos = [0,0,0,0];
if (_show) then {
    _pos = ctrlPosition (_display displayCtrl 2001);
};
for "_idc" from 2002 to 2006 step 1 do {
    _pos set [1, (_pos select 1) + (_pos select 3)];
    private _ctrl = (_display displayCtrl _idc);
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};
