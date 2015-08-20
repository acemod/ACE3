/*
 * Author: Garth 'L-H' de Wet
 * Checks whether the player is in the downwash of a helicopter and handles applying effects of that.
 *
 * Arguments:
 * 0: Arguments <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_goggles_fnc_OnEachFrame, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit"];
_unit = GETUNIT;

if (isNull _unit) exitWith {};

GVAR(FrameEvent) set [0, !(GVAR(FrameEvent) select 0)];
if (GVAR(FrameEvent) select 0) exitWith {
    if ((vehicle _unit != _unit) && {!([_unit] call EFUNC(common,isTurnedOut))}) exitWith {(GVAR(FrameEvent) select 1) set [0, false]; };
    GVAR(FrameEvent) set [1, ([_unit] call FUNC(isInRotorWash))];
};
private ["_rotorWash","_safe"];
_rotorWash = GVAR(FrameEvent) select 1;
_safe = false;
if !(_rotorWash select 0) exitWith {
    if (GVAR(postProcessEyes_Enabled)) then {
        GVAR(postProcessEyes_Enabled) = false;
        if ((GETVAR(_unit,GVAR(dustHandler),-1)) != -1) then {
            [GETVAR(_unit,GVAR(dustHandler),-1)] call CBA_fnc_removePerFrameHandler;
            SETVAR(_unit,GVAR(dustHandler),-1);
        };
        GVAR(postProcessEyes) ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
        GVAR(postProcessEyes) ppEffectCommit 2;
        [{
            GVAR(postProcessEyes) ppEffectEnable false;
        }, [], 2, 0.5] call EFUNC(common,waitAndExecute);
    };
};
if ((headgear _unit) != "") then {
    _safe = (getNumber (ConfigFile >> "CfgWeapons" >> (headgear _unit) >> "ACE_Protection") == 1);
};
if !(_safe) then {
    if !([_unit] call FUNC(isGogglesVisible)) exitWith {};
    if (GETDUSTT(_unit,DAMOUNT) < 2) then {
        if (!GETDUSTT(_unit,DACTIVE)) then {
            SETDUST(_unit,DACTIVE,true);
            [] call FUNC(applyDust);
        } else {
            if ((_rotorWash select 1) > 0.5) then {
                [] call FUNC(applyDust);
            };
        };
    };
    _safe = (getNumber (ConfigFile >> "CfgGlasses" >> (goggles _unit) >> "ACE_Protection") == 1);
};
if (_safe) exitWith {};
if ((_rotorWash select 1) <= 15) then {
    private "_scale";
    _scale = 0.7;
    if ((_rotorWash select 1) != 0) then {
        _scale = CLAMP(0.3*(_rotorWash select 1),0.1,0.3);
    } else {
        _scale = 0.1;
    };
    _scale = 1 - _scale;
    if ((GETVAR(_unit,GVAR(dustHandler),-1)) != -1) then {
        [GETVAR(_unit,GVAR(dustHandler),-1)] call CBA_fnc_removePerFrameHandler;
        SETVAR(_unit,GVAR(dustHandler),-1);
    };
    if !(_unit getVariable ["ACE_EyesDamaged", false]) then {
        GVAR(postProcessEyes_Enabled) = true;
        GVAR(postProcessEyes) ppEffectAdjust [1, 1, 0, [0,0,0,0], [_scale,_scale,_scale,_scale],[1,1,1,0]];
        GVAR(postProcessEyes) ppEffectCommit 0.5;
        GVAR(postProcessEyes) ppEffectEnable true;
    };
};
