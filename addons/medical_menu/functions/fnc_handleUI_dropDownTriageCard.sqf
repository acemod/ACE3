/*
 * Author: Glowbal
 * Handle the triage card display
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_menu_handleUI_dropDownTriageCard
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_display", "_pos", "_ctrl", "_currentPos", "_idc"];

disableSerialization;

_display = uiNamespace getVariable QGVAR(medicalMenu);
_pos = [0, 0, 0, 0];
_currentPos = ctrlPosition (_display displayCtrl 2002);
_currentPos params ["_currentPosX", "_currentPosY"];
if (_currentPosX == 0 && _currentPosY == 0) then {
    _pos = ctrlPosition (_display displayCtrl 2001);
};

for "_idc" from 2002 to 2006 step 1 do {
    _pos set [1, (_pos select 1) + (_pos select 3)];
    _ctrl = _display displayCtrl _idc;
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};
