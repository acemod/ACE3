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

private ["_timeToCut"];

PARAMS_2(_unit,_fenceObject);
if (_unit != ACE_player) exitWith {};

_timeToCut = if ([ACE_player] call EFUNC(common,isEngineer)) then {5} else {10};

[ACE_player, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

if (_timeToCut > 5) then {
  playSound "ACE_wirecutter_sound_long";
} else {
  playSound "ACE_wirecutter_sound";
};

[_timeToCut, [_fenceObject], {(_this select 0) call FUNC(cutDownFenceCallback)}, {(_this select 0) call FUNC(cutDownFenceAbort)}, localize "STR_ACE_logistics_wirecutter_CuttingFence"] call EFUNC(common,progressBar);
