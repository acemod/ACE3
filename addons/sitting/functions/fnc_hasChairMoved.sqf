/*
 * Author: Jonpas
 * Checks if chair moved from original position.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Seat Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat, seatPos] call ace_sitting_fnc_hasChairMoved;
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_2(_seat,_seatPosOrig);

TRACE_2("Chair position",_seatPosOrig,getPosASL _seat);

// Check each coordinate due to possibility of tiny movements in simulation
(getPosASL _seat) select 0 < (_seatPosOrig select 0) - 0.01 || {(getPosASL _seat) select 0 > (_seatPosOrig select 0) + 0.01} ||
{(getPosASL _seat) select 1 < (_seatPosOrig select 1) - 0.01 || {(getPosASL _seat) select 1 > (_seatPosOrig select 1) + 0.01}} ||
{(getPosASL _seat) select 2 < (_seatPosOrig select 2) - 0.01 || {(getPosASL _seat) select 2 > (_seatPosOrig select 2) + 0.01}}
