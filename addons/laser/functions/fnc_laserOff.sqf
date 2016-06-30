/*
 * Author: Nou
 * Turn a laser designator off.
 *
 * Arguments:
 * 0: UUID (from laserOn) <string>
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private ["_uuid"];
_uuid = _this select 0;
["ace_laserOff", [_uuid]] call CBA_fnc_globalEvent;
