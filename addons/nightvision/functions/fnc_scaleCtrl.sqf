/*
 * Author: Dslyecxi, PabstMirror
 * Determines night vision source (player/vehicle) - Updates UI based on type.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Default position [x,y,w,h] <ARRAY>
 * 2: Zoom Level <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nightvision_fnc_scaleCtrl
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrl", "_default_pos", "_scale"];

if (!ctrlShown _ctrl) exitWith {};

_ctrl ctrlSetPosition
[(((_default_pos select 0) - 0.5) * _scale) + 0.5,
(((_default_pos select 1) - 0.5) * _scale) + 0.5,
(_default_pos select 2) * _scale,
(_default_pos select 3) * _scale];


_ctrl ctrlCommit 0;
