#include "script_component.hpp"
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
 * [] call ace_medical_menu_fnc_handleUI_dropDownTriageCard
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable QGVAR(medicalMenu);
private _pos = [0, 0, 0, 0];
private _currentPos = ctrlPosition (_display displayCtrl 2002);
_currentPos params ["_currentPosX", "_currentPosY"];
if (_currentPosX == 0 && _currentPosY == 0) then {
    _pos = ctrlPosition (_display displayCtrl 2001);
};

for "_idc" from 2002 to 2006 step 1 do {
    _pos set [1, (_pos select 1) + (_pos select 3)];
    private _ctrl = _display displayCtrl _idc;
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};
