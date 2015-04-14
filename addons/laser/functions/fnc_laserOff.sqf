/*
 * Author: Nou
 * Turn a laser designator off.
 *
 * Arguments:
 * 0: UUID (from laserOn) <string>
 *
 * Return value:
 * None
 */
 
#include "script_component.hpp"

private ["_uuid"];
_uuid = _this select 0;
["laser_laserOff", [_uuid]] call EFUNC(common,globalEvent);
