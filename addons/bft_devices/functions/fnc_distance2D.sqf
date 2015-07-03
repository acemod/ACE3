/*
 * Author: Gundy
 *
 * Description:
 *   Calculate the 2D distance between two positions
 *
 * Arguments:
 *   0: 2D or 3D position <ARRAY>
 *   1: 2D or 3D position <ARRAY>
 *
 * Return Value:
 *   Distance <FLOAT>
 *
 * Example:
 *   [getPosATL player, [0,0,0]] call ace_bft_devices_fnc_distance2D;
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_pos1,_pos2);

// set height to 0;
_pos1 set [2,0];
_pos2 set [2,0];

_pos1 distance _pos2