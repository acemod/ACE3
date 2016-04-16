/*
 * Author: BaerMitUmlaut
 * Calculates the duty of the current animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation name <STRING>
 *
 * Return Value:
 * Duty <NUMBER>
 *
 * Example:
 * ["AidlPercMstpSlowWrflDnon_G05"] call ace_advanced_fatigue_fnc_getAnimDuty
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_animName"];
private ["_duty", "_animPrefix"];

_duty = 1;
_animPrefix = _animName select [0, 4];
if ((_animPrefix == "Aidl") || {_animPrefix == "Amov"}) then {
    switch (stance _unit) do {
        case ("CROUCH"): {
            _duty = 1.5;
        };
        case ("PRONE"): {
            _duty = 20;
        };
        default {
            _duty = 1;
        };
    };

    if ((_animName select [9, 3]) == "tac") then {
        _duty = _duty * 1.5;
    };
    if ((_animName select [13, 3]) == "ras") then {
        _duty = _duty * 1.2;
    };
};

if (_unit getVariable ["ace_dragging_isCarrying", false]) then {
    _duty = _duty * 3;
};

_duty
