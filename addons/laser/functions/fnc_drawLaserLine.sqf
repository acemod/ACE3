#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Used to draw laser line across all clients
 *
 * Arguments:
 * 0: start pos (AGL) <ARRAY>
 * 1: end pos (AGL) <ARRAY>
 * 2: 4 element color <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [getpos Player, getpos (laserTarget Player), [1,1,1,1]] call ace_laser_fnc_drawLaserLine
 *
 * Public: No
 */

params ["_list"];

if ((currentVisionMode ACE_player) > 0) then {
    {
        _x params ["_start", "_end", "_color"];
        drawLine3D [_start, _end, _color];
    } forEach _list;
};
