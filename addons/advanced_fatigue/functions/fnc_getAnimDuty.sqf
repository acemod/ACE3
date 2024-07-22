#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Calculates the duty ('postureWeight') of the current animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation name <STRING>
 *
 * Return Value:
 * Duty <NUMBER>
 *
 * Example:
 * [player, "AidlPercMstpSlowWrflDnon_G05"] call ace_advanced_fatigue_fnc_getAnimDuty
 *
 * Public: No
 */
params ["_unit", "_animName"];

private _duty = 1;
private _animType = _animName select [1, 3];

GVAR(isSwimming) = false;
GVAR(isProne) = (stance _unit) == "PRONE";

if (_animType in ["idl", "mov", "adj"]) then {
    switch (_animName select [5, 3]) do {
        case ("knl"): {
            _duty = 1.5;
        };
        case ("pne"): {
            _duty = 10;
            GVAR(isProne) = true; // #4880 - Unarmed sprint->prone has wrong `stance`
        };
        default {
            _duty = 1;
        };
    };

    if (currentWeapon _unit != "") then {
        if (_animName select [13, 3] == "ras") then {
            if (_animName select [9, 3] == "tac") then {
                // high ready jog/walk
                _duty = _duty * (1 + 0.8*GVAR(inertia));
            } else {
                // low ready jog
                _duty = _duty * (1 + 0.2*GVAR(inertia));
            };
        };
    };
} else {
    // swimming and diving
    switch (true) do {
        case (_animType in ["swm", "ssw", "bsw"]): {
            _duty = 6.5;
            GVAR(isSwimming) = true;
        };
        case (_animType in ["dve", "sdv", "bdv"]): {
            _duty = 2.5;
            GVAR(isSwimming) = true;
        };
    };
};

_duty
