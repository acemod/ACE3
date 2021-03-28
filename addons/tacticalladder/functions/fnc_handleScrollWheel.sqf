#include "script_component.hpp"
/*
 * Author: Rocko, Ruthberg
 * Handles lengthening and tilting of the ladder
 *
 * Arguments:
 * Amount scrolled <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [1] call ace_tacticalladder_fnc_handleScrollWheel;
 *
 * Public: No
 */

params ["_scroll"];

if (isNull GVAR(ladder)) exitWith { false };

if (ACE_Modifier == 0) then {
    // Lengthening
    if (_scroll > 0) then {
        private _currentStep = GVAR(currentStep);
        if (_currentStep == 11) exitWith {};
        _currentStep = _currentStep + 1;
        if (GVAR(ladder) animationPhase (format["extract_%1", _currentStep]) == 0) then {
            GVAR(ladder) animate [format["extract_%1", _currentStep], 1];
            GVAR(currentStep) = _currentStep;
        };
    };
    if (_scroll < 0) then {
        private _currentStep = GVAR(currentStep);
        if (_currentStep == 3) exitWith {};
        if (GVAR(ladder) animationPhase (format["extract_%1", _currentStep]) == 1) then {
            GVAR(ladder) animate [format["extract_%1", _currentStep], 0];
            GVAR(currentStep) = _currentStep - 1;
        };
    };
};// else {
    // Tilting (disabled due to sinking, interaction point offset and unsuitable animation)
    //GVAR(currentAngle) = 0 max (GVAR(currentAngle) + _scroll) min 30;
    //GVAR(ladder) animate ["rotate", GVAR(currentAngle)];
//};

true
