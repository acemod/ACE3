/*
 * Author: Garth 'L-H' de Wet
 * Checks whether the player is in the downwash of a helicopter and handles applying effects of that.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ACE_Goggles_RotorWash", "OnEachFrame", "call ace_goggles_fnc_OnEachFrame;"] call BIS_fnc_addStackedEventHandler;
 *
 * Public: No
 */
#include "script_component.hpp"
if (isNull(ace_player)) exitWith {};
GVAR(FrameEvent) set [0, !(GVAR(FrameEvent) select 0)];
if (GVAR(FrameEvent) select 0) exitWith {
    if (vehicle ace_player != ace_player && {!isTurnedOut ACE_player}) exitWith {(GVAR(FrameEvent) select 1) set [0, false]; };
    GVAR(FrameEvent) set [1, ([ace_player] call FUNC(isInRotorWash))];
};
private ["_rotorWash","_safe"];
_rotorWash = GVAR(FrameEvent) select 1;
_safe = false;
if !(_rotorWash select 0) exitWith {
    if (GVAR(PostProcessEyes_Enabled)) then {
        GVAR(PostProcessEyes_Enabled) = false;
        if (GVAR(DustHandler) != -1) then { // should be fixed in dev CBA
            [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
            GVAR(DustHandler) = -1;
        };
        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
        GVAR(PostProcessEyes) ppEffectCommit 2;
        GVAR(DustHandler) = [{
            GVAR(PostProcessEyes) ppEffectEnable false;
            GVAR(DustHandler) = -1;
        }, [], 2, 0.5] call EFUNC(common,waitAndExecute);
    };
};
if ((headgear ace_player) != "") then {
    _safe = (getNumber (ConfigFile >> "CfgWeapons" >> (headgear ace_player) >> "ACE_Protection") == 1);
};
if !(_safe) then {
    if !([ace_player] call FUNC(isGogglesVisible)) exitWith{};
    if (GETDUSTT(DAMOUNT) < 2) then {
        if (!GETDUSTT(DACTIVE)) then {
            SETDUST(DACTIVE,true);
            call FUNC(applyDustEffect);
        } else {
            if ((_rotorWash select 1) > 0.5) then {
                call FUNC(applyDustEffect);
            };
        };
    };
    _safe = (getNumber (ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_Protection") == 1);
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
    if (GVAR(DustHandler) != -1) then { // should be fixed in dev CBA
        [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
        GVAR(DustHandler) = -1;
    };
    if !(ace_player getVariable ["ACE_EyesDamaged", false]) then {
        GVAR(PostProcessEyes_Enabled) = true;
        GVAR(PostProcessEyes) ppEffectAdjust [1, 1, 0, [0,0,0,0], [_scale,_scale,_scale,_scale],[1,1,1,0]];
        GVAR(PostProcessEyes) ppEffectCommit 0.5;
        GVAR(PostProcessEyes) ppEffectEnable true;
    };
};
