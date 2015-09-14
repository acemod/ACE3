/*
 * Author: Nou
 * Turn a laser designator off.
 *
 * Arguments:
 * 0: UUID (from laserOn) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_UUID] call ace_laser_fnc_laserOff
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_uuid"];
["laser_laserOff", [_uuid]] call EFUNC(common,globalEvent);
