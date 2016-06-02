/*
 * Author: voiper
 * Play the chemlight snap and shake sound. Mostly used as an EFUNC.
 *
 * Arguments:
 * 0: PositionASL to play the sound <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [eyePos ACE_player] call ace_chemlights_fnc_shakeSound;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_posASL"];

playSound3D [QUOTE(PATHTO_R(sounds\chemlight_prepare.wav)), objNull, false, _posASL, 1, 1, 65];