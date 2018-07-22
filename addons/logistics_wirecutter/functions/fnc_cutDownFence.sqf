/*
 * Author: gpgpgpgp, commy2, PabstMirror, mharis001
 * Starts cutting down a fence. Triggers global "ace_wireCuttingStarted" event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fence <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_logistics_wirecutter_fnc_cutDownFence
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_fence"];
TRACE_2("Fence cutting started",_unit,_fence);

if (_unit != ACE_player) exitWith {};

// Get cut time based on if unit is a engineer
private _cutTime = if (_unit call EFUNC(common,isEngineer)) then {CUT_TIME_ENGINEER} else {CUT_TIME_DEFAULT};

if !(_unit call EFUNC(common,isSwimming)) then {
    [_unit, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);
};

[
    _cutTime,
    [_unit, _fence, 0],
    {
        TRACE_1("Fence cutting successful",_this);
        (_this select 0) params ["_unit", "_fence"];

        _fence setDamage 1;
        if !(_unit call EFUNC(common,isSwimming)) then {
            [_unit, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
        };
    },
    {
        TRACE_1("Fence cutting failed",_this);
        (_this select 0) params ["_unit"];

        if !(_unit call EFUNC(common,isSwimming)) then {
            [_unit, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
        };
    },
    localize LSTRING(CuttingFence),
    {
        params ["_args", "_elapsedTime"];
        _args params ["_unit", "_fence", "_lastSoundTime"];

        if (_elapsedTime > _lastSoundTime + SOUND_CLIP_TIME_SPACING) then {
            playSound3D [QPATHTO_R(sound\wirecut.ogg), objNull, false, getPosASL _unit, 3, 1, 10];
            _args set [2, _elapsedTime];
        };

        !isNull _fence
        && {damage _fence < 1}
        && {HAS_WIRECUTTER(_player)}
    },
    ["isNotSwimming"]
] call EFUNC(common,progressBar);

["ace_wireCuttingStarted", [_unit, _fence]] call CBA_fnc_globalEvent;
