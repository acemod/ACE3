#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, ulteq
 * Handles any audible, visual and physical effects of fatigue.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fatigue <NUMBER>
 * 2: Overexhausted <BOOL>
 * 3: Forward Angle <NUMBER>
 * 4: Side Angle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, 0.5, 3.3, true, 0, 0] call ace_advanced_fatigue_fnc_handleEffects
 *
 * Public: No
 */

params ["_unit", "_fatigue", "_overexhausted", "_fwdAngle", "_sideAngle"];

// - Audible effects ----------------------------------------------------------
GVAR(lastBreath) = GVAR(lastBreath) + 1;

if (_fatigue > 0.4 && {GVAR(lastBreath) > (_fatigue * -10 + 9)} && {!underwater _unit}) then {
    if (!isGameFocused) exitWith {};

    switch (true) do {
        case (_fatigue < 0.6): {
            playSound (QGVAR(breathLow) + str (floor random 6));
        };
        case (_fatigue < 0.85): {
            playSound (QGVAR(breathMid) + str (floor random 6));
        };
        default {
            playSound (QGVAR(breathMax) + str (floor random 6));
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
    if (GVAR(setAnimExclusions) isEqualTo []) then {
        _unit setAnimSpeedCoef linearConversion [0.7, 0.9, _fatigue, 1, 0.5, true];
    };

    if (isSprintAllowed _unit && _fatigue > 0.7) then { // small checks like these are faster without lazy eval
        [_unit, "blockSprint", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
    } else {
        if (!isSprintAllowed _unit && _fatigue < 0.7) then {
            [_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
        };
    };
};

// If other components are setting setAnimSpeedCoef, do not change animSpeedCoef
if (getAnimSpeedCoef _unit != 1 && {GVAR(setAnimExclusions) isEqualTo []}) then {
    TRACE_1("reset",getAnimSpeedCoef _unit);
    _unit setAnimSpeedCoef 1;
};

if (!isForcedWalk _unit && _fatigue >= 1) then { // small checks like these are faster without lazy eval
    [_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
    [_unit, "blockSprint", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
} else {
    if (isForcedWalk _unit && _fatigue < 0.7) then {
        [_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
        [_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
    } else {
        // Forward angle is the slope of the terrain, side angle simulates the unevenness/roughness of the terrain
        if (isSprintAllowed _unit && {_fatigue > 0.7 || abs _fwdAngle > 20 || abs _sideAngle > 20}) then {
            [_unit, "blockSprint", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
        } else {
            if (!isSprintAllowed _unit && _fatigue < 0.6 && abs _fwdAngle < 20 && abs _sideAngle < 20) then {
                [_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
            };
        };
    };
};

_unit setVariable [QGVAR(aimFatigue), _fatigue];
