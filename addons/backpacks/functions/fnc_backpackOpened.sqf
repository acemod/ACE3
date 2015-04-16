/*
 * Author: commy2
 *
 * Someone opened your backpack. Execute locally.
 * 
 * Argument:
 * 0: Who accessed your inventory? (Object)
 * 1: Unit that wields the backpack (Object)
 * 2: The backpack object (Object)
 * 
 * Return value:
 * None.
 */
#include "script_component.hpp"

PARAMS_3(_unit,_target,_backpack);

// do cam shake if the target is the player
if ([_target] call EFUNC(common,isPlayer)) then {
    addCamShake [4, 0.5, 5];
};

// play a rustling sound
private ["_sounds", "_position"];

_sounds = [
    /*"a3\sounds_f\characters\ingame\AinvPknlMstpSlayWpstDnon_medic.wss",
    "a3\sounds_f\characters\ingame\AinvPknlMstpSlayWrflDnon_medic.wss",
    "a3\sounds_f\characters\ingame\AinvPpneMstpSlayWpstDnon_medic.wss",
    "a3\sounds_f\characters\ingame\AinvPpneMstpSlayWrflDnon_medic.wss"*/

    QUOTE(PATHTO_R(sounds\zip_in.wav)),
    QUOTE(PATHTO_R(sounds\zip_out.wav))
];

_position = _target modelToWorldVisual (_target selectionPosition "Spine3");
_position = _position call EFUNC(common,positionToASL);

playSound3D [
    _sounds select floor random count _sounds,
    objNull,
    false,
    _position,
    1,
    1,
    50
];
