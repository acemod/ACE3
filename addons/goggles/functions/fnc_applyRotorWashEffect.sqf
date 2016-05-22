/*
 * Author: Garth 'L-H' de Wet, commy2
 * Handles the rotor wash effects.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_applyRotorWashEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_fnc_underCover"];

_unit = ACE_player;

if (!alive _unit) exitWith {};

// idk. chaching magic? ends with isInRotorWash check.
GVAR(FrameEvent) set [0, !(GVAR(FrameEvent) select 0)];

if (GVAR(FrameEvent) select 0) exitWith {
    if (vehicle _unit != _unit && {!isTurnedOut _unit}) exitWith {
        (GVAR(FrameEvent) select 1) set [0, false];
    };

    GVAR(FrameEvent) set [1, ([_unit] call FUNC(isInRotorWash))];
};

// check if the unit is affected by rotor wash
private ["_rotorWash", "_safe"];

_rotorWash = GVAR(FrameEvent) select 1;
_safe = false;

// no rotor wash? remove effects.
if !(_rotorWash select 0) exitWith {
    if (GVAR(PostProcessEyes_Enabled)) then {
        GVAR(PostProcessEyes_Enabled) = false;

        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [1, 1, 1, 0]];
        GVAR(PostProcessEyes) ppEffectCommit 2;

        [{
            if (GVAR(DustHandler) == -1) then {
                GVAR(PostProcessEyes) ppEffectEnable false;
            }
        }, [], 2] call CBA_fnc_waitAndExecute;

        [GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
        GVAR(DustHandler) = -1;
    };
};

// check protection of helmet
if (headgear _unit != "") then {
    _safe = getNumber (configFile >> "CfgWeapons" >> headgear _unit >> "ACE_Protection") == 1;
};

// check protection of goggles
if !(_safe) then {
    if !([_unit] call FUNC(isGogglesVisible)) exitWith {};

    if (GETDUSTT(DAMOUNT) < 2) then {
        if !(GETDUSTT(DACTIVE)) then {
            SETDUST(DACTIVE,true);

            call FUNC(applyDustEffect);
        } else {
            if (_rotorWash select 1 > 0.5) then {
                call FUNC(applyDustEffect);
            };
        };
    };

    _safe = getNumber (ConfigFile >> "CfgGlasses" >> goggles _unit >> "ACE_Protection") == 1;
};

// quit if protected by goggles or helmet
if (_safe) exitWith {};

// apply rotor wash effect
if (_rotorWash select 1 > 0) then {
    private _scale = 0.7;

    if (_rotorWash select 1 > 0) then {
        _scale = CLAMP(0.3 * (_rotorWash select 1),0.1,0.3);
    } else {
        _scale = 0.1;
    };

    _scale = 1 - _scale;

    [GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
    GVAR(DustHandler) = -1;

    if !(_unit getVariable ["ACE_EyesDamaged", false]) then {
        GVAR(PostProcessEyes_Enabled) = true;
        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [_scale, _scale, _scale, _scale], [1, 1, 1, 0]];
        GVAR(PostProcessEyes) ppEffectCommit 0.5;
        GVAR(PostProcessEyes) ppEffectEnable true;
    };
};
