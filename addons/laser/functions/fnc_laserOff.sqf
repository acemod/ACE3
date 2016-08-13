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

params ["_uuid"];
["ace_laserOff", [_uuid]] call CBA_fnc_globalEvent;
