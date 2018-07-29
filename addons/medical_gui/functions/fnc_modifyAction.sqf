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
        _bloodLossOnBodyPart = _bloodLossOnBodyPart + (20 * _amountOf * _bleeding);
    };
} forEach (_target getvariable [QEGVAR(medical,openWounds), []]);

private _hasTourniquet = HAS_TOURNIQUET_APPLIED_ON(_target,_partIndex);

switch (true) do {
    case (_bloodLossOnBodyPart >= 0.15): {
        if (_hasTourniquet) then {
            _actionData set [2, QPATHTOF(ui\ui\icons\medical_crossRed_t.paa)];
        } else {
            _actionData set [2, QPATHTOF(ui\ui\icons\medical_crossRed.paa)];
        };
    };

    case (_bloodLossOnBodyPart > 0): {
        if (_hasTourniquet) then {
            _actionData set [2, QPATHTOF(ui\ui\icons\medical_crossYellow_t.paa)];
        } else {
            _actionData set [2, QPATHTOF(ui\ui\icons\medical_crossYellow.paa)];
        };
    };

    default {
        if (_hasTourniquet) then {
            _actionData set [2, QPATHTOF(ui\ui\icons\medical_cross_t.paa)];
        };
    };
};
