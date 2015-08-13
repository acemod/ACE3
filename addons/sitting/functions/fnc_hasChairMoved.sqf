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
 * [seat, seatPos] call ace_sitting_fnc_hasChairMoved
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_seat", "_seatPosOrig"];

TRACE_2("Chair position",_seatPosOrig,getPosASL _seat);

(getPosASL _seat) params ["_seatX", "_seatY", "_seatZ"];
_seatPosOrig params ["_seatOrigX", "_seatOrigY", "_seatOrigZ"];

// Check each coordinate due to possibility of tiny movements in simulation
if (abs (_seatX - _seatOrigX) > 0.01) exitWith {true};
if (abs (_seatY - _seatOrigY) > 0.01) exitWith {true};
if (abs (_seatZ - _seatOrigZ) > 0.01) exitWith {true};
false
