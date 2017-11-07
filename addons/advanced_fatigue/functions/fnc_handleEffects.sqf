/*
 * Author: BaerMitUmlaut
 * Handles any audible, visual and physical effects of fatigue.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fatigue <NUMBER>
 * 2: Respiratory Rate <NUMBER>
 * 3: Current Speed <NUMBER>
 * 4: Max Run Speed <NUMBER>
 * 5: Max Sprint Speed <NUMBER>
 * 6: Forward Angle <NUMBER>
 * 7: Side Angle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, 0.5, 3.3, true, 0, 0] call ace_advanced_fatigue_fnc_handleEffects
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit", "_fatigue", "_respiratoryRate", "_currentSpeed", "_maxRunSpeed", "_maxSprintSpeed", "_fwdAngle", "_sideAngle"];

// - Audible effects ----------------------------------------------------------
GVAR(lastBreath) = GVAR(lastBreath) + 1;
if (_respiratoryRate > 0.4 && {GVAR(lastBreath) > (_respiratoryRate * -10 + 9)} && {!underwater _unit}) then {
    switch (true) do {
        case (_respiratoryRate < 0.6): {
            playSound (QGVAR(breathLow) + str(floor random 6));
        };
        case (_respiratoryRate < 0.85): {
            playSound (QGVAR(breathMid) + str(floor random 6));
        };
        default {
            playSound (QGVAR(breathMax) + str(floor random 6));
        };
    };
    GVAR(lastBreath) = 0;
};

// - Visual effects -----------------------------------------------------------
GVAR(ppeBlackoutLast) = GVAR(ppeBlackoutLast) + 1;
if (GVAR(ppeBlackoutLast) == 1) then {
    GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    GVAR(ppeBlackout) ppEffectCommit 1;
} else {
    if (_fatigue > 0.85) then {
        if (GVAR(ppeBlackoutLast) > (100 - _fatigue * 100) / 3) then {
            GVAR(ppeBlackout) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2,2,0,0,0,0.1,0.5]];
            GVAR(ppeBlackout) ppEffectCommit 1;
            GVAR(ppeBlackoutLast) = 0;
        };
    };
};

// - Physical effects ---------------------------------------------------------
if (GVAR(isSwimming)) exitWith {
    _unit setAnimSpeedCoef linearConversion [0.7, 0.9, _fatigue, 1, 0.5, true];

    if ((isSprintAllowed _unit) && _fatigue > 0.7) then {
        [_unit, "blockSprint", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
    } else {
        if ((!isSprintAllowed _unit) && _fatigue < 0.7) then {
            [_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
        };
    };
};

private _currentAnimCoef = getAnimSpeedCoef _unit;
if (_currentSpeed > 0.1) then {
    if (_currentSpeed > 4 * _currentAnimCoef || _currentSpeed > GVAR(lastSpeed) + 0.8) then {
        _unit setAnimSpeedCoef (0.70 max (_currentAnimCoef * ((_maxSprintSpeed / _currentSpeed) ^ 0.5)) min 1.0);
    } else {
        if (isForcedWalk _unit) then {
            _unit setAnimSpeedCoef (0.80 max (_currentAnimCoef * ((_maxRunSpeed / _currentSpeed) ^ 0.5)) min 1.2);
        } else {
            _unit setAnimSpeedCoef (0.70 max (_currentAnimCoef * ((_maxRunSpeed / _currentSpeed) ^ 0.5)) min 1.0);
        };
    };
    GVAR(lastSpeed) = _currentSpeed;
};

if (!isForcedWalk _unit && {_fatigue >= 1 || (_maxRunSpeed < 2.4 && _currentSpeed < 2.5 && _currentAnimCoef < 0.75)}) then {
    _unit setAnimSpeedCoef 1.2;
    [_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
} else {
    if (isForcedWalk _unit && {_fatigue < 0.90 && _maxRunSpeed > 2.5}) then {
        if (!isWalking _unit) then {
            _unit setAnimSpeedCoef 0.90;
        };
        [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
    } else {
        if (isSprintAllowed _unit && {abs(_fwdAngle) > 20 || abs(_sideAngle) > 20 || (_maxSprintSpeed < 3.5 && _currentAnimCoef < 0.85)}) then {
            _unit setAnimSpeedCoef 1;
            [_unit, "blockSprint", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
        } else {
            if (!isSprintAllowed _unit && {_fatigue < 0.8 && {abs(_fwdAngle) < 20 && abs(_sideAngle) < 20 && _maxSprintSpeed > 4.5}}) then {
                [_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
            };
        };
    };
};

switch (stance _unit) do {
    case ("CROUCH"): {
        _unit setCustomAimCoef (1.0 + _fatigue ^ 2 * 0.1);
    };
    case ("PRONE"): {
        _unit setCustomAimCoef (1.0 + _fatigue ^ 2 * 2.0);
    };
    default {
        _unit setCustomAimCoef (1.5 + _fatigue ^ 2 * 3.0);
    };
};
