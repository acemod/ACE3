/*
 * Author: Gundy
 *
 * Description:
 *   Calculate octant (i.e. "norht-west") from direction
 *
 * Arguments:
 *   0: Degree value to convert 0 to 360 <INTEGER>
 *
 * Return Value:
 *   Matching octant as either N, NE, E, SE, S, SW, W, NW <STRING>
 *
 * Example:
 *   [direction player] call ace_bft_devices_fnc_degreeToOctant;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_dir","_octant"];

_dir = _this select 0;
_octant = round (_dir / 45);

["N ","NE","E ","SE","S ","SW","W ","NW","N "] select _octant