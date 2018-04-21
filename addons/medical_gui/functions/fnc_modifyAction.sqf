/*
 * Author: esteldunedain
 * Modify the visuals of a medical action point.
 * On Basic medical: modify the icon color based on damage on that body part.
 *
 * Arguments:
 * 0: The Patient Unit <OBJECT>
 * 1: The Diagnosing Unit <OBJECT>
 * 2: Body part index <NUMBER>
 * 3: The action to modify <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player", "_partIndex", "_actionData"];

private _bloodLossOnBodyPart = 0;

// Add all bleeding from wounds on selection
{
    _x params ["", "", "_bodyPartN", "_amountOf", "_bleeding"];

    if (_bodyPartN == _partIndex) then {
        _bloodLossOnBodyPart = _bloodLossOnBodyPart + (_amountOf * _bleeding);
    };
} forEach (_target getvariable [QEGVAR(medical,openWounds), []]);

private _hasTourniquet = (((_target getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]]) select _partIndex) > 0);

private _frBL = 0 max (_bloodLossOnBodyPart / BLOOD_LOSS_RED_THRESHOLD) min 1;
private _colorInt = ceil ((_frBL * (BLOOD_LOSS_TOTAL_COLORS - 1)) + 1); // ceil because any bleeding more than zero shouldn't be white

private _path = [QPATHTOF(ui\icons\b), _colorInt, ["", "t"] select _hasTourniquet, ".paa"] joinString "";

_actionData set [2, _path];
