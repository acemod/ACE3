#include "..\script_component.hpp"
/*
 * Author: commy2
 * Someone opened your backpack. Play sound and camshake. Execute locally.
 *
 * Arguments:
 * 0: Who accessed your inventory? <OBJECT>
 * 1: The backpack object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, backpack] call ace_backpacks_fnc_backpackOpened
 *
 * Public: No
 */

params ["_target", "_backpack"];

// do cam shake if the target is the player
if (_target call EFUNC(common,isPlayer)) then {
    addCamShake [4, 0.5, 5];
};

// play a zipper sound effect
private _sounds = [
    QUOTE(PATHTO_R(sounds\zip_in.wav)),
    QUOTE(PATHTO_R(sounds\zip_out.wav))
];

private _position = _target modelToWorldVisualWorld (_target selectionPosition "Spine3");

playSound3D [
    selectRandom _sounds,
    objNull,
    false,
    _position,
    1,
    1,
    50
];
