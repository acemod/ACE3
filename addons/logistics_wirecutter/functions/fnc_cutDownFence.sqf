/*
 * Author: gpgpgpgp, edited by commy2, PabstMirror
 * Starts cutting down a fence
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fence <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, berlinWall] call ace_logistics_wirecutter_fnc_cutDownFence
 *
 * Public: No
 */
#include "script_component.hpp"

#define SOUND_CLIP_TIME_SPACEING    1.5
private ["_timeToCut", "_progressCheck"];

PARAMS_2(_unit,_fenceObject);
if (_unit != ACE_player) exitWith {};

_timeToCut = if ([ACE_player] call EFUNC(common,isEngineer)) then {7.5} else {11};

[ACE_player, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

_progressCheck = {
    PARAMS_2(_args,_passedTime);
    EXPLODE_2_PVT(_args,_fenceObject,_lastSoundEffectTime);
    if (_passedTime > (_lastSoundEffectTime + SOUND_CLIP_TIME_SPACEING)) then {
        // playSound "ACE_wirecutter_sound";
        playSound3D [QUOTE(PATHTO_R(sound\wirecut.ogg)), objNull, false, (getPosASL ACE_player), 3, 1, 10];
        _args set [1, _passedTime];
    };

    ((!isNull _fenceObject) && {(damage _fenceObject) < 1} && {("ACE_wirecutter" in (items ACE_player))})
};

[_timeToCut, [_fenceObject,0], {(_this select 0) call FUNC(cutDownFenceCallback)}, {(_this select 0) call FUNC(cutDownFenceAbort)}, localize STRING(CuttingFence), _progressCheck] call EFUNC(common,progressBar);
