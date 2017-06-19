/*
 * Author: esteldunedain
 * Modify the visuals of a medical action point.
 * On Basic medical: modify the icon color based on damage on that body part.
 *
 * Arguments:
 * 0: The Patient Unit <OBJECT>
 * 1: The Diagnosing Unit <OBJECT>
 * 2: Selection Number <NUMBER>
 * 3: The action to modify <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, 2, "action"] call ACE_medical_fnc_modifyMedicalAction
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_player", "_partNumber", "_actionData"];

private _bloodLossOnSelection = 0;
// Add all bleeding from wounds on selection
{
    _x params ["", "", "_selectionX", "_amountOf", "_percentageOpen"];
    if (_selectionX == _partNumber) then {
        _bloodLossOnSelection = _bloodLossOnSelection + (_amountOf * _percentageOpen);
    };
} forEach (_target getvariable [QGVAR(openWounds), []]);

if (_bloodLossOnSelection >= 0.15) then {
    _actionData set [2, QPATHTOF(UI\icons\medical_crossRed.paa)];
} else {
    if (_bloodLossOnSelection > 0 ) then {
        _actionData set [2, QPATHTOF(UI\icons\medical_crossYellow.paa)];
    };
};
