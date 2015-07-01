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
 * 1 call ace_tacticalladder_fnc_handleScrollWheel;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_scroll);

if (isNull GVAR(ladder)) exitWith { false };

if (GETMVAR(ACE_Modifier,0) == 0) then {
    private ["_currentStep"];
    // Lengthening
    if (_scroll > 0) then {
        _currentStep = GVAR(currentStep);
        if (_currentStep == 11) exitWith {};
        _currentStep = _currentStep + 1;
        if (GVAR(ladder) animationPhase (format["extract_%1", _currentStep]) == 0) then {
            GVAR(ladder) animate [format["extract_%1", _currentStep], 1];
            GVAR(currentStep) = _currentStep;
        };
    };
    if (_scroll < 0) then {
        _currentStep = GVAR(currentStep);
        if (_currentStep == 3) exitWith {};
        if (GVAR(ladder) animationPhase (format["extract_%1", _currentStep]) == 1) then {
            GVAR(ladder) animate [format["extract_%1", _currentStep], 0];
            GVAR(currentStep) = _currentStep - 1;
        };		
    };
} else {
    // Tilting
    GVAR(currentAngle) = 0 max (GVAR(currentAngle) + _scroll) min 90;
    GVAR(ladder) animate ["rotate", GVAR(currentAngle)];
};

true