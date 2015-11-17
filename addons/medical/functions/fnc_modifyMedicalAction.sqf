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
 * ReturnValue:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_player", "_selectionN", "_actionData"];

if (GVAR(level) < 2 || {!([_target] call FUNC(hasMedicalEnabled))}) exitwith {
    private ["_pointDamage"];
    _pointDamage = (_target getvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]]) select _selectionN;

    if (_pointDamage >= 0.8) exitWith {
        _actionData set [2, QUOTE(PATHTOF(UI\icons\medical_crossRed.paa))];
    };
    if (_pointDamage > 0) exitWith {
        _actionData set [2, QUOTE(PATHTOF(UI\icons\medical_crossYellow.paa))];
    };
};

private ["_openWounds", "_amountOf"];
_openWounds = _target getvariable [QGVAR(openWounds), []];
{
    _x params ["", "", "_selectionX", "_amountOf", "_x4"];
    if (_amountOf > 0 && {(_selectionN == _selectionX)} && {_x4 > 0}) exitwith {
        _actionData set [2, QUOTE(PATHTOF(UI\icons\medical_crossRed.paa))];
    };
} foreach _openWounds;
