#include "script_component.hpp"
/*
 * Author: esteldunedain, SilentSpike, mharis001
 * Modifies the medical action icons to show blood loss and tourniquets.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body part index <NUMBER>
 * 2: Action data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, 0, _actionData] call ace_medical_gui_fnc_modifyAction
 *
 * Public: No
 */

#define COLOR_SCALE ["#ffffff", "#fff1a1", "#ffe075", "#ffcb55", "#ffb73c", "#ffa127", "#ff8815", "#ff6d05", "#ff4b00", "#ff0000"]

params ["_target", "_partIndex", "_actionData"];

private _bloodLossOnBodyPart = 0;

// Add all bleeding from wounds on selection
{
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];

    if (_bodyPartN == _partIndex) then {
        _bloodLossOnBodyPart = _bloodLossOnBodyPart + (_amountOf * _bleeding);
    };
} forEach GET_OPEN_WOUNDS(_target);

private _frBL = 0 max (_bloodLossOnBodyPart / BLOOD_LOSS_RED_THRESHOLD) min 1;
private _colorInt = ceil (_frBL * (BLOOD_LOSS_TOTAL_COLORS - 1)); // ceil because any bleeding more than zero shouldn't be white

if (HAS_TOURNIQUET_APPLIED_ON(_target,_partIndex)) then {
    _actionData set [2, format [QPATHTOF(ui\cross_t_%1.paa), _colorInt]];
} else {
    _actionData set [2, [QPATHTOF(ui\cross.paa), COLOR_SCALE select _colorInt]];
};
