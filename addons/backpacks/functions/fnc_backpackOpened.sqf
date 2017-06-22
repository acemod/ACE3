/*
 * Author: commy2
 * Someone opened your backpack. Play sound and camshake. Execute locally.
 *
 * Arguments:
 * 0: Who accessed your inventory? <Object>
 * 1: Unit that wields the backpack <Object>
 * 2: The backpack object <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, backpack] call ace_backpacks_fnc_backpackOpened
 *
 * Public: No
 */
#include "script_component.hpp"

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

private _position = AGLToASL (_target modelToWorldVisual (_target selectionPosition "Spine3"));

playSound3D [
    selectRandom _sounds,
    objNull,
    false,
    _position,
    1,
    1,
    50
];
