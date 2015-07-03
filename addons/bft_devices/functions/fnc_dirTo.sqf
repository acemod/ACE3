/*
 * Author: Gundy
 *
 * Description:
 *   Returns compass direction (horizontal) from first position to second position
 *
 * Arguments:
 *   0: 2D or 3D position <ARRAY>
 *   1: 2D or 3D position <ARRAY>
 *
 * Return Value:
 *   Direction (0 - 360) <FLOAT>
 *
 * Example:
 *   [getPosATL player, [0,0,0]] call ace_bft_devices_fnc_dirTo;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_dirTo"];

PARAMS_2(_pos1,_pos2);

_dirTo = ((_pos2 select 0) - (_pos1 select 0)) atan2 ((_pos2 select 1) - (_pos1 select 1));

(_dirTo + 360) % 360
